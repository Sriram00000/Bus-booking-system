package com.busbooking.controller;

import com.busbooking.dto.TicketRequest;
import com.busbooking.dto.TicketResponse;
import com.busbooking.service.TicketService;
import com.busbooking.config.JwtUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.http.*;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/tickets")
@RequiredArgsConstructor
public class TicketController {

    private final TicketService ticketService;
    private final JwtUtils jwtUtils; // updated to match your bean

    @PostMapping("/book")
    public ResponseEntity<TicketResponse> bookTicket(@RequestBody TicketRequest request,
                                                     @RequestHeader("Authorization") String authHeader) {
        String email = jwtUtils.extractEmail(authHeader.substring(7)); // email from token
        return ticketService.bookTicket(request, email);
    }

    @GetMapping("/qrcode/{ticketId}")
    public ResponseEntity<byte[]> getQrImageSecure(@PathVariable Long ticketId,
                                                   @RequestHeader("Authorization") String authHeader) {
        String email = jwtUtils.extractEmail(authHeader.substring(7)); // Get email from JWT
        byte[] qrImage = ticketService.getQrCodeIfOwned(ticketId, email); // Should return byte[]

        return ResponseEntity.ok()
                .contentType(MediaType.IMAGE_PNG) 
                .body(qrImage); // Sends the actual image binary, not text or JSON
    }


    @ExceptionHandler(Exception.class)
    public ResponseEntity<String> handleException(Exception e) {
        e.printStackTrace();
        return ResponseEntity.status(400).body("Error: " + e.getMessage());
    }
}
