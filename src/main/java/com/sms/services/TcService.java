package com.sms.services;

import java.util.List;

import com.sms.entity.Tc;

public interface TcService {
    List<Tc> getAllTcRecords();
    Tc saveTc(Tc tc);
    List<Tc> getTcByStudentId(Long studentId);
    List<Tc> getTcByStudentRollNo(String rollNo);

    void deleteTcByStudentId(Long studentId);
}
