package com.busbooking.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@Data  
@NoArgsConstructor
@AllArgsConstructor
public class QRCodeData {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String busNumber;
    private String journeyDate;

    @Column(unique = true)
    private String qrCode;

    private boolean used;  // Make sure this exists
}
