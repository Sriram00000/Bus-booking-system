package com.busbooking.controller;

import com.busbooking.dto.LoginRequest;
import com.busbooking.dto.RegisterRequest;
import com.busbooking.dto.AuthResponse;
import com.busbooking.entity.Role;
import com.busbooking.service.AuthService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/auth")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("/login")
    public ResponseEntity<AuthResponse> login(@RequestBody @Valid LoginRequest req) {
        return ResponseEntity.ok(authService.login(req));
    }

    @PostMapping("/register/passenger")
    public ResponseEntity<AuthResponse> registerPassenger(@RequestBody @Valid RegisterRequest req) {
        return ResponseEntity.ok(authService.register(req, Role.PASSENGER));
    }

    @PostMapping("/register/conductor")
    public ResponseEntity<AuthResponse> registerConductor(@RequestBody @Valid RegisterRequest req) {
        return ResponseEntity.ok(authService.register(req, Role.CONDUCTOR));
    }
}
