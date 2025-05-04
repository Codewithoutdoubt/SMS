package com.cms.repository;

import com.cms.entity.Scholarship;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ScholarshipRepository extends JpaRepository<Scholarship, Long> {
    List<Scholarship> findByScholarshipId(Long scholarshipId);

    List<Scholarship> findByStudentId(Long studentId);

    @Query("SELECT s FROM Scholarship s JOIN s.student st WHERE st.rollNo = :rollNo")
    List<Scholarship> findByStudentRollNo(@Param("rollNo") String rollNo);

    List<Scholarship> findByApplicationNo(String applicationNo);
}
