package com.cms.services;

import com.cms.entity.Tc;
import java.util.List;
import java.util.Optional;

public interface TcService {
    List<Tc> getAllTcRecords();
    Tc saveTc(Tc tc);
    Optional<Tc> getTcByStudentId(Long studentId);
    List<Tc> getTcByStudentRollNo(String rollNo);
}
