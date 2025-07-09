package com.sms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sms.entity.Placement;

import java.util.List;

@Repository
public interface PlacementRepository extends JpaRepository<Placement, Long> {
    List<Placement> findByStudentId(Long studentId);

    List<Placement> findByStudentIdAndCompanyName(Long studentId, String companyName);
}
