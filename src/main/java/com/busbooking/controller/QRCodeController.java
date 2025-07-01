package com.busbooking.controller;

import com.busbooking.service.QRCodeService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/qr")
@RequiredArgsConstructor
public class QRCodeController {

    private final QRCodeService qrCodeService;

    @PostMapping("/scan")
    public ResponseEntity<?> scanTicket(
            @RequestParam("qrCode") String qrCode,
            @AuthenticationPrincipal org.springframework.security.core.userdetails.User user) {

        // Validate presence of username
        if (user == null || user.getUsername() == null) {
            return ResponseEntity.status(401).body("Unauthorized");
        }

        return qrCodeService.validateTicket(qrCode, user.getUsername());
    }
}
