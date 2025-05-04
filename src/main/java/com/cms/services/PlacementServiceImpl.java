package com.cms.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.cms.entity.Placement;
import com.cms.repository.PlacementRepository;

@Service
public class PlacementServiceImpl implements PlacementService {

    private final PlacementRepository placementRepository;


    public PlacementServiceImpl(PlacementRepository placementRepository) {
        this.placementRepository = placementRepository;
    }

    @Override
    public Placement savePlacement(Placement placement) {
        return placementRepository.save(placement);
    }

    @Override
    public Optional<Placement> getPlacementById(Long id) {
        return placementRepository.findById(id);
    }

    @Override
    public List<Placement> getAllPlacements() {
        return placementRepository.findAll();
    }

    @Override
    public void deletePlacement(Long id) {
        placementRepository.deleteById(id);
    }

    @Override
    public List<Placement> getPlacementsByStudentId(Long studentId) {
        return placementRepository.findByStudentId(studentId);
    }

    @Override
    public List<Placement> getPlacementsByStudentIdAndCompanyName(Long studentId, String companyName) {
        return placementRepository.findByStudentIdAndCompanyName(studentId, companyName);
    }
}
