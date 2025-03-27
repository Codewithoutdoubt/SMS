package com.cms.services;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cms.entity.Attendance;
import com.cms.repository.AttendanceRepository;

@Service
public class AttendanceService {
    @Autowired
    private final AttendanceRepository attendanceRepository;


    public AttendanceService(AttendanceRepository attendanceRepository) {
        this.attendanceRepository = attendanceRepository;
    }

    @Transactional  // Ensures that the entire method is executed within a transaction.
    public void recordAttendance(List<Attendance> attendanceList) {
        try {
            attendanceRepository.saveAll(attendanceList);  // JPA's saveAll() efficiently handles batch inserts
        } catch (Exception e) {
            // Log the exception (important for debugging)
            System.err.println("Error recording attendance: " + e.getMessage()); // Use proper logging!
            throw new RuntimeException("Failed to record attendance", e); //Re-throw the exception to rollback transaction.
        }
    }
}