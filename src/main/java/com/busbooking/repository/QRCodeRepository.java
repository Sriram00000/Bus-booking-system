package com.busbooking.repository;

import com.busbooking.entity.QRCodeData;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface QRCodeRepository extends JpaRepository<QRCodeData, Long> {
    
    Optional<QRCodeData> findByQrCode(String qrCode);
}
