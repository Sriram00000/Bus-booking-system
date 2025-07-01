package com.busbooking.dto;

import lombok.Data;

@Data
public class TicketRequest {
    private String source;
    private String destination;
    private int passengerCount;
}
