package com.busbooking.controller;

import com.busbooking.entity.ConductorDetails;
import com.busbooking.repository.ConductorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('ADMIN')")

@RequiredArgsConstructor
public class AdminController {

    private final ConductorRepository conductorRepository;

    // 1. Approve conductor by ID
    @PutMapping("/approve-conductor/{id}")
    public ResponseEntity<String> approveConductor(@PathVariable Long id) {
        ConductorDetails conductor = conductorRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Conductor not found"));

        if (conductor.isApproved()) {
            return ResponseEntity.ok("Conductor already approved.");
        }

        conductor.setApproved(true);
        conductorRepository.save(conductor);
        return ResponseEntity.ok("Conductor approved successfully.");
    }

    //  2. View all conductors
    @GetMapping("/conductors")
    public ResponseEntity<List<ConductorDetails>> getAllConductors() {
        return ResponseEntity.ok(conductorRepository.findAll());
    }

    // 3. View pending conductor approvals
    @GetMapping("/pending-conductors")
    public ResponseEntity<List<ConductorDetails>> getPendingConductors() {
        List<ConductorDetails> pending = conductorRepository.findByApprovedFalse();
        return ResponseEntity.ok(pending);
    }
}
