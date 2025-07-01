package com.busbooking.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class BusRoute {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(unique = true)
    private String routeNumber;

    @OneToMany(mappedBy = "busRoute", cascade = CascadeType.ALL)
    private List<Stop> stops = new ArrayList<>();
}
