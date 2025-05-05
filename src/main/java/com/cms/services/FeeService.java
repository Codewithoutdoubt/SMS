package com.cms.services;

import com.cms.entity.Fee;

import java.util.List;
import java.util.Optional;

public interface FeeService {
    Fee saveFee(Fee fee);
    Optional<Fee> getFeeById(Long id);
    List<Fee> getAllFees();
    void deleteFee(Long id);
    List<Fee> getFeesByStudentId(Long studentId);

    void deleteFeesByStudentId(Long studentId);
}
