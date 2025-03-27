package com.cms.controller;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cms.entity.Attendance;
import com.cms.entity.Student;
import com.cms.services.AttendanceService;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {
    @Autowired
    private final AttendanceService attendanceService;

    public AttendanceController(AttendanceService attendanceService) {
        this.attendanceService = attendanceService;
    }

    @PostMapping("/record")
    public ResponseEntity<String> recordAttendance(@RequestBody List<AttendanceRecordDto> attendanceRecords) {
        try {
            List<Attendance> attendanceList = new ArrayList<>();
            for (AttendanceRecordDto record : attendanceRecords) {
                Attendance attendance = new Attendance(record.getStudentId(), record.getDate(), record.isPresent(), null);
                attendanceList.add(attendance);
            }

            attendanceService.recordAttendance(attendanceList);
            return ResponseEntity.status(HttpStatus.CREATED).body("Attendance recorded successfully.");

        } catch (Exception e) {
            System.err.println("Error in controller: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to record attendance: " + e.getMessage());
        }
    }


    //Helper DTO for the request body
    public static class AttendanceRecordDto {
      private Student studentId;
      private LocalDate date;
      private boolean present;

      public Student getStudentId() {
        return studentId;
      }

      public void setStudentId(Student studentId) {
        this.studentId = studentId;
      }

      public LocalDate getDate() {
        return date;
      }

      public void setDate(LocalDate date) {
        this.date = date;
      }

      public boolean isPresent() {
        return present;
      }

      public void setPresent(boolean present) {
        this.present = present;
      }
    }
}