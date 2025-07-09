package com.sms.services;

import java.util.List;
import java.util.Optional;

import com.sms.entity.Fee;

public interface FeeService {
    Fee saveFee(Fee fee);
    Optional<Fee> getFeeById(Long id);
    List<Fee> getAllFees();
    void deleteFee(Long id);
    List<Fee> getFeesByStudentId(Long studentId);

    void deleteFeesByStudentId(Long studentId);
}
