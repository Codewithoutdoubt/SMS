package com.sms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.entity.Fee;
import com.sms.repository.FeeRepository;

import java.util.List;
import java.util.Optional;

@Service
public class FeeServiceImpl implements FeeService {

    @Autowired
    private final FeeRepository feeRepository;

    public FeeServiceImpl(FeeRepository feeRepository) {
        this.feeRepository = feeRepository;
    }

    @Override
    public Fee saveFee(Fee fee) {
        return feeRepository.save(fee);
    }

    @Override
    public Optional<Fee> getFeeById(Long id) {
        return feeRepository.findById(id);
    }

    @Override
    public List<Fee> getAllFees() {
        return feeRepository.findAll();
    }

    @Override
    public void deleteFee(Long id) {
        feeRepository.deleteById(id);
    }

    @Override
    public List<Fee> getFeesByStudentId(Long studentId) {
        return feeRepository.findByStudentId(studentId);
    }

    @Override
    public void deleteFeesByStudentId(Long studentId) {
        List<Fee> fees = feeRepository.findByStudentId(studentId);
        if (fees != null && !fees.isEmpty()) {
            feeRepository.deleteAll(fees);
        }
    }
}
