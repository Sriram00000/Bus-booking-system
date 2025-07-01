package com.busbooking.dto;

import lombok.Data;

@Data
public class TicketResponse {
	private Long ticketId;
	private String qrCodeImage; // base64 or image URL
    private String source;
    private String destination;
    private int numberOfPassengers;
    private double fare;
    private String busNumber;
    private String bookingTime;
    private String journeyDate;
    private String duration; // Optional
    private String distance; // Optional
}
