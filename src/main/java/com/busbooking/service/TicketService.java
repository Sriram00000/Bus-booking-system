package com.busbooking.service;

import com.busbooking.dto.TicketRequest;
import com.busbooking.dto.TicketResponse;
import com.busbooking.entity.*;
import com.busbooking.repository.*;
import com.busbooking.util.QRCodeGenerator;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
@RequiredArgsConstructor
public class TicketService {

    private final RouteRepository routeRepository;
    private final UserRepository userRepository;
    private final TicketRepository ticketRepository;

    //  Full booking logic
    public ResponseEntity<TicketResponse> bookTicket(TicketRequest request, String email) {
        Optional<BusRoute> matchedRouteOpt = routeRepository.findAll().stream()
                .filter(route -> routeHasStopsInOrder(route, request.getSource(), request.getDestination()))
                .findFirst();

        if (matchedRouteOpt.isEmpty()) {
            return ResponseEntity.status(404).body(null);
        }

        BusRoute route = matchedRouteOpt.get();
        

        if (route.getStops() == null || route.getStops().isEmpty()) {
            return ResponseEntity.badRequest().body(null);
        }

        int stopsBetween = countIntermediateStops(route, request.getSource(), request.getDestination());
        int fare = 10 + (3 * stopsBetween);

        User user = userRepository.findByEmail(email).orElse(null);
        if (user == null) return ResponseEntity.status(404).body(null);

        Ticket ticket = new Ticket();
        ticket.setUser(user);
        ticket.setBusRoute(route);
        ticket.setSource(request.getSource());
        ticket.setDestination(request.getDestination());
        ticket.setPassengerCount(request.getPassengerCount());
        ticket.setFare(fare);
        ticket.setUsed(false);
        ticket.setBookingDate(new Date());

        ticket = ticketRepository.save(ticket);

        String qrText = QRCodeGenerator.generateQRCodeText(ticket);
        ticket.setQrCode(qrText);

        // Save QR code image to file system for testing/conductor-side scan
        try {
            QRCodeGenerator.generateQRCodeImageFile(qrText, ticket.getId());
        } catch (Exception e) {
            System.err.println("Failed to save QR image file: " + e.getMessage());
        }

        ticket = ticketRepository.save(ticket);


        TicketResponse response = buildTicketResponse(ticket, route, true); // include base64 image

        return ResponseEntity.ok(response);
    }

    //  View ticket and QR code by authenticated user
    public ResponseEntity<TicketResponse> viewTicketByUser(Long ticketId, String email) {
        Ticket ticket = ticketRepository.findById(ticketId).orElse(null);
        if (ticket == null) {
            return ResponseEntity.status(404).body(null);
        }

        if (!ticket.getUser().getEmail().equalsIgnoreCase(email)) {
            return ResponseEntity.status(403).body(null); // Forbidden
        }

        BusRoute route = ticket.getBusRoute();
        TicketResponse response = buildTicketResponse(ticket, route, true); // with QR base64

        return ResponseEntity.ok(response);
    }

    //  Helper to construct TicketResponse
    private TicketResponse buildTicketResponse(Ticket ticket, BusRoute route, boolean includeQrBase64) {
        TicketResponse response = new TicketResponse();
        response.setTicketId(ticket.getId());
        response.setSource(ticket.getSource());
        response.setDestination(ticket.getDestination());
        response.setNumberOfPassengers(ticket.getPassengerCount());
        response.setFare(ticket.getFare());
        response.setBusNumber(route.getRouteNumber());
        response.setBookingTime(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(ticket.getBookingDate()));
        response.setJourneyDate(new SimpleDateFormat("yyyy-MM-dd").format(ticket.getBookingDate()));

        if (includeQrBase64) {
            try {
                byte[] qrBytes = QRCodeGenerator.generateQRCodeImage(ticket.getQrCode(), 300, 300);
                String base64Image = "data:image/png;base64," + Base64.getEncoder().encodeToString(qrBytes);
                response.setQrCodeImage(base64Image);
            } catch (Exception e) {
                response.setQrCodeImage("Failed to generate QR");
            }
        }

        return response;
    }

    public Long createTicketAndReturnId(TicketRequest request, String email) {
        ResponseEntity<TicketResponse> response = bookTicket(request, email);
        if (response.getStatusCode().is2xxSuccessful() && response.getBody() != null) {
            return response.getBody().getTicketId();
        }
        return -1L;
    }

    public byte[] getQrCodeIfOwned(Long ticketId, String email) {
        Ticket ticket = ticketRepository.findById(ticketId)
                .orElseThrow(() -> new RuntimeException("Ticket not found"));

        if (!ticket.getUser().getEmail().equals(email)) {
            throw new RuntimeException("Unauthorized access to QR Code");
        }

        try {
            return QRCodeGenerator.generateQRCodeImage(ticket.getQrCode(), 300, 300);
        } catch (Exception e) {
            throw new RuntimeException("Failed to generate QR Code image", e);
        }
    }

    private boolean routeHasStopsInOrder(BusRoute route, String source, String destination) {
        List<Stop> stops = route.getStops();
        int sourceIndex = -1;
        int destIndex = -1;

        for (int i = 0; i < stops.size(); i++) {
            String stopName = stops.get(i).getName();
            if (stopName.equalsIgnoreCase(source)) {
                sourceIndex = i;
            }
            if (stopName.equalsIgnoreCase(destination)) {
                destIndex = i;
            }
        }

        return sourceIndex != -1 && destIndex != -1 && sourceIndex < destIndex;
    }

    private int countIntermediateStops(BusRoute route, String source, String destination) {
        List<Stop> stops = route.getStops();
        int sourceIndex = -1;
        int destIndex = -1;

        for (int i = 0; i < stops.size(); i++) {
            String stopName = stops.get(i).getName();
            if (stopName.equalsIgnoreCase(source)) {
                sourceIndex = i;
            }
            if (stopName.equalsIgnoreCase(destination)) {
                destIndex = i;
            }
        }

        return (sourceIndex != -1 && destIndex != -1 && destIndex > sourceIndex)
                ? destIndex - sourceIndex
                : 0;
    }
}
