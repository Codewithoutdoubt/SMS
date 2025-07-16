package com.sms.repository;

import com.sms.entity.Subject;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;
@Repository 
public interface SubjectRepository extends JpaRepository<Subject, Integer> {
    // Additional query methods if needed
 @Query("SELECT s FROM Subject s WHERE s.branchId = :branchId AND s.semesterId = :semesterId")
 List<Subject> findByBranchAndSemester(@Param("branchId") Integer branchId, @Param("semesterId") Integer semesterId);
}
