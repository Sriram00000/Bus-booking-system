package com.busbooking.service;

import com.busbooking.entity.Role;
import com.busbooking.entity.Ticket;
import com.busbooking.entity.User;
import com.busbooking.repository.ConductorRepository;
import com.busbooking.repository.TicketRepository;
import com.busbooking.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import java.util.HashMap;
import java.util.Map;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j // Enables logging
public class QRCodeService {

    private final TicketRepository ticketRepository;
    private final UserRepository userRepository;
    private final ConductorRepository conductorRepository;

    public ResponseEntity<?> validateTicket(String qrCode, String email) {
        //  Validate conductor user
        User user = userRepository.findByEmail(email)
                .orElseThrow(() -> new UsernameNotFoundException("User not found: " + email));

        if (user.getRole() != Role.CONDUCTOR) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Map.of("status", "error", "message", "Access denied: Only conductors can scan tickets."));
        }

        var conductor = conductorRepository.findByUser(user)
                .orElseThrow(() -> new RuntimeException("Conductor details not found"));

        if (!conductor.isApproved()) {
            return ResponseEntity.status(HttpStatus.FORBIDDEN)
                    .body(Map.of("status", "error", "message", "Conductor approval pending. Please wait for admin approval."));
        }

        //  Fetch Ticket
        var ticketOpt = ticketRepository.findByQrCode(qrCode);
        if (ticketOpt.isEmpty()) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND)
                    .body(Map.of("status", "error", "message", "Invalid or expired QR code."));
        }

        Ticket ticket = ticketOpt.get();

        if (ticket.isUsed()) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST)
                    .body(Map.of("status", "error", "message", "❌ Ticket has already been used."));
        }

        //  Mark as used
        ticket.setUsed(true);
        ticketRepository.save(ticket);

        //  Logging
        log.info("Ticket ID {} scanned successfully by conductor {}", ticket.getId(), user.getEmail());

        //  Structured Success Response
        Map<String, Object> response = new HashMap<>();
        response.put("status", "success");
        response.put("message", "✅ Ticket verified and marked as used");
        response.put("ticketId", ticket.getId());
       
        response.put("fare", ticket.getFare());

        return ResponseEntity.ok(response);
    }
}
