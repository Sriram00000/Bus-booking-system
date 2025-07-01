package com.busbooking.repository;

import com.busbooking.entity.ConductorDetails;
import com.busbooking.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ConductorRepository extends JpaRepository<ConductorDetails, Long> {

    // Find all conductors who are not yet approved
    List<ConductorDetails> findByApprovedFalse();

    // Find conductor details by user
    Optional<ConductorDetails> findByUser(User user);

    // Find all approved conductors
    List<ConductorDetails> findByApprovedTrue();

    // Find conductor by user's email (needed in the future)
    @Query("SELECT c FROM ConductorDetails c WHERE c.user.email = :email")
    Optional<ConductorDetails> findByUserEmail(@Param("email") String email);
}
