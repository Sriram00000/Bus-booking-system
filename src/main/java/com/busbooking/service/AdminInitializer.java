package com.busbooking.service;

import com.busbooking.entity.Role;
import com.busbooking.entity.User;
import com.busbooking.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class AdminInitializer implements CommandLineRunner {

    private final UserRepository userRepository;
    private final PasswordEncoder encoder;

    @Override
    public void run(String... args) throws Exception {
        String adminEmail = "admin@bus.com";

        if (!userRepository.existsByEmail(adminEmail)) {
            User admin = new User();
            admin.setName("Admin");
            admin.setEmail(adminEmail);
            admin.setPassword(encoder.encode("admin123"));
            admin.setRole(Role.ADMIN);
            admin.setApproved(true);

            userRepository.save(admin);
            System.out.println("✅ Default Admin created with email: " + adminEmail + " and password: admin123");
        }
    }
}
