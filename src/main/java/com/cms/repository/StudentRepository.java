package com.cms.repository;

import java.util.List;

import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Repository;
import com.cms.entity.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
    @Override
    @NonNull
    List<Student> findAll();
    
    @Query("SELECT DISTINCT s FROM Student s LEFT JOIN FETCH s.scholarships")
    @NonNull
    List<Student> findAllWithScholarships();
    
    Student findByRollNo(String rollNo);

    Student findByRollNoAndIdNot(String rollNo, Long id);
}
