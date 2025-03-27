package com.cms.repository;
import java.time.LocalDate;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cms.entity.Attendance;
import com.cms.entity.Student;

@Repository
public interface AttendanceRepository extends JpaRepository<Attendance, Long> {

    //Optional:  Add methods to find attendance records by student ID or date if needed
    List<Attendance> findByStudentId(Student studentId);
    List<Attendance> findByDate(LocalDate date);
}