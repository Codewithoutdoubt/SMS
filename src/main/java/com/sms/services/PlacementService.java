package com.sms.services;

import java.util.List;
import java.util.Optional;

import com.sms.entity.Placement;

public interface PlacementService {
    Placement savePlacement(Placement placement);
    Optional<Placement> getPlacementById(Long id);
    List<Placement> getAllPlacements();
    void deletePlacement(Long id);
    List<Placement> getPlacementsByStudentId(Long studentId);

    List<Placement> getPlacementsByStudentIdAndCompanyName(Long studentId, String companyName);

    void deletePlacementsByStudentId(Long studentId);
}
