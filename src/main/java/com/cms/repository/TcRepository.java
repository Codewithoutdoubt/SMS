package com.cms.repository;

import com.cms.entity.Tc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

@Repository
public interface TcRepository extends JpaRepository<Tc, Long> {
    @SuppressWarnings("null")
    List<Tc> findAll();
    List<Tc> findByStudentId(Long studentId);

    @Query("SELECT t FROM Tc t WHERE t.student.rollNo = :rollNo")
    List<Tc> findByStudentRollNo(@Param("rollNo") String rollNo);
}
