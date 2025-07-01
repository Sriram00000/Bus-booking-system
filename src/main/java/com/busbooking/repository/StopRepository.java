package com.busbooking.repository;


import org.springframework.data.jpa.repository.JpaRepository;

import com.busbooking.entity.Stop;

public interface StopRepository extends JpaRepository<Stop, Long> {
    // You can add custom query methods here if needed
}
