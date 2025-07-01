package com.busbooking.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.busbooking.entity.BusRoute;

public interface RouteRepository extends JpaRepository<BusRoute, Long> {
    // You can add custom query methods here if needed
	boolean existsByRouteNumber(String routeNumber);

}
