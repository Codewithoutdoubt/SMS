package com.cms.services;

import com.cms.entity.Placement;

import java.util.List;
import java.util.Optional;

public interface PlacementService {
    Placement savePlacement(Placement placement);
    Optional<Placement> getPlacementById(Long id);
    List<Placement> getAllPlacements();
    void deletePlacement(Long id);
    List<Placement> getPlacementsByStudentId(Long studentId);

    List<Placement> getPlacementsByStudentIdAndCompanyName(Long studentId, String companyName);
}
