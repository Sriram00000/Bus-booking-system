package com.busbooking.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.busbooking.entity.Ticket;

public interface TicketRepository extends JpaRepository<Ticket, Long> {
    Optional<Ticket> findByQrCode(String qrCode);

	
}


