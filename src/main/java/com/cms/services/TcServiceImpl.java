package com.cms.services;

import com.cms.entity.Tc;
import com.cms.repository.TcRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TcServiceImpl implements TcService {

    @Autowired
    private TcRepository tcRepository;

    @Override
    public List<Tc> getAllTcRecords() {
        return tcRepository.findAll();
    }

    @Override
    public Tc saveTc(Tc tc) {
        return tcRepository.save(tc);
    }

    @Override
    public Optional<Tc> getTcByStudentId(Long studentId) {
        return tcRepository.findByStudentId(studentId);
    }

    @Override
    public List<Tc> getTcByStudentRollNo(String rollNo) {
        return tcRepository.findByStudentRollNo(rollNo);
    }
}
