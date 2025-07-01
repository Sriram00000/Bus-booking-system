package com.busbooking.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Ticket {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    private User user;

    @ManyToOne
    private BusRoute busRoute;

    private String source;
    private String destination;
    private int passengerCount;
    private int fare;
    private String qrCode;

    private boolean used;

    @Temporal(TemporalType.TIMESTAMP)
    private Date bookingDate;
}
