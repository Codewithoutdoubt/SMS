package com.cms.repository;

import com.cms.entity.Result;
import com.cms.entity.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ResultRepository extends JpaRepository<Result, Long> {
    
    @Query("SELECT r.student FROM Result r WHERE r.id = :id")
    Student findStudentByResultId(@Param("id") Long id);

    List<Result> findByStudentId(Long studentId);

    @Query("SELECT r FROM Result r WHERE r.student.id = :studentId ORDER BY r.semester.id ASC")
    List<Result> findByStudentIdOrderBySemesterIdAsc(@Param("studentId") Long studentId);

    List<Result> findByStudentIdAndSemesterId(Long studentId, Long semesterId);
}
