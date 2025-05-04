package com.cms.services;

import com.cms.entity.Tc;
import java.util.List;

public interface TcService {
    List<Tc> getAllTcRecords();
    Tc saveTc(Tc tc);
    List<Tc> getTcByStudentId(Long studentId);
    List<Tc> getTcByStudentRollNo(String rollNo);
}
