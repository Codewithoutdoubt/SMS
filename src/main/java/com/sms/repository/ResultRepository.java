package com.sms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sms.entity.Result;
import com.sms.entity.Student;

@Repository
public interface ResultRepository extends JpaRepository<Result, Long> {
    void deleteById(Long id);
    List<Result> findByStudentId(Long studentId);
}