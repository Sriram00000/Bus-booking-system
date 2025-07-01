package com.busbooking.service;

import com.busbooking.config.JwtUtils;
import com.busbooking.dto.LoginRequest;
import com.busbooking.dto.RegisterRequest;
import com.busbooking.dto.AuthResponse;
import com.busbooking.entity.ConductorDetails;
import com.busbooking.entity.Role;
import com.busbooking.entity.User;
import com.busbooking.repository.ConductorRepository;
import com.busbooking.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.*;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final UserRepository userRepo;
    private final ConductorRepository conductorRepo;
    private final PasswordEncoder encoder;
    private final AuthenticationManager authManager;
    private final JwtUtils jwtUtils;

    public AuthResponse register(RegisterRequest req, Role role) {
        if (userRepo.existsByEmail(req.getEmail())) {
            throw new RuntimeException("Email is already registered.");
        }

        User user = new User();
        user.setName(req.getName());
        user.setEmail(req.getEmail());
        user.setPassword(encoder.encode(req.getPassword()));
        user.setRole(role);
        user.setApproved(role != Role.CONDUCTOR);

        userRepo.save(user);

        if (role == Role.CONDUCTOR) {
            ConductorDetails conductor = new ConductorDetails();
            conductor.setUser(user);
            conductor.setName(req.getName());
            conductor.setPhoneNumber(req.getPhoneNumber());
            conductor.setApproved(false);
            conductorRepo.save(conductor);
        }

        String token = jwtUtils.generateToken(user.getEmail());
        return new AuthResponse(token);
    }

    public AuthResponse login(LoginRequest req) {
        authManager.authenticate(
            new UsernamePasswordAuthenticationToken(req.getEmail(), req.getPassword()));

        String token = jwtUtils.generateToken(req.getEmail());
        return new AuthResponse(token);
    }
}
