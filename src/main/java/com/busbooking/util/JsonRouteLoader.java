package com.busbooking.util;
import java.util.*;
import java.io.IOException;
import java.io.InputStream;
import java.util.Map;

import jakarta.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Component;

import com.busbooking.entity.BusRoute;
import com.busbooking.entity.Stop;
import com.busbooking.repository.RouteRepository;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.boot.CommandLineRunner;

@Component
public class JsonRouteLoader implements CommandLineRunner {

    @Autowired
    private RouteRepository routeRepository;

    @Override
    public void run(String... args) throws Exception {
        ObjectMapper mapper = new ObjectMapper();
        InputStream inputStream = new ClassPathResource("data/bus_routes.json").getInputStream();

        TypeReference<List<Map<String, Object>>> typeRef = new TypeReference<>() {};
        List<Map<String, Object>> routeList = mapper.readValue(inputStream, typeRef);

        for (Map<String, Object> routeMap : routeList) {
            String routeNumber = (String) routeMap.get("routeNumber");

            // Skip if already exists
            if (routeRepository.existsByRouteNumber(routeNumber)) {
                System.out.println("⚠️ Route already exists, skipping: " + routeNumber);
                continue;
            }

            List<String> stops = (List<String>) routeMap.get("stops");

            BusRoute route = new BusRoute();
            route.setRouteNumber(routeNumber);

            List<Stop> stopList = new ArrayList<>();
            for (int i = 0; i < stops.size(); i++) {
                Stop stop = new Stop();
                stop.setName(stops.get(i));
                stop.setStopOrder(i + 1);
                stop.setBusRoute(route);
                stopList.add(stop);
            }

            route.setStops(stopList);
            routeRepository.save(route);
            System.out.println("✅ Saved route: " + routeNumber);
        }
    }

}
