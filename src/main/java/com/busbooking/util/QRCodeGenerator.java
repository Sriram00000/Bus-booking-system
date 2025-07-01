package com.busbooking.util;

import com.busbooking.entity.Ticket;
import com.google.zxing.*;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Date;

public class QRCodeGenerator {

    // 1. For returning QR code as byte[] (used in API)
    public static byte[] generateQRCodeImage(String text, int width, int height) throws Exception {
        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        ByteArrayOutputStream pngOutputStream = new ByteArrayOutputStream();
        MatrixToImageWriter.writeToStream(bitMatrix, "PNG", pngOutputStream);
        return pngOutputStream.toByteArray();
    }

    // 2. For saving QR code as PNG file locally (e.g., C:/busbooking/qrcodes/ticket-21.png)
    public static Path generateQRCodeImageFile(String text, Long ticketId) throws Exception {
        int width = 300;
        int height = 300;

        QRCodeWriter qrCodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height);

        String baseDir = "C:\\Users\\manik\\Documents\\workspace-spring-tools-for-eclipse-4.30.0.RELEASE\\bus-booking-system\\qrcodes"; // Change path if needed
        File dir = new File(baseDir);
        if (!dir.exists()) {
            dir.mkdirs(); // Create folder if not exists
        }

        String fileName = "ticket-" + ticketId + ".png";
        Path filePath = Paths.get(baseDir, fileName);

        MatrixToImageWriter.writeToPath(bitMatrix, "PNG", filePath);
        return filePath;
    }

    // 3. Build the actual text content to embed in QR
    public static String generateQRCodeText(Ticket ticket) {
        return "Ticket ID: " + ticket.getId() +
                "\nEmail: " + ticket.getUser().getEmail() +
                "\nRoute: " + ticket.getBusRoute().getRouteNumber() +
                "\nSource: " + ticket.getSource() +
                "\nDestination: " + ticket.getDestination() +
                "\nFare: ₹" + ticket.getFare() +
                "\nDate: " + new Date();
    }
}
