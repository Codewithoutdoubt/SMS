package com.cms.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.cms.entity.Semester;

@Repository
public interface SemesterRepository extends JpaRepository<Semester, Long> {
    @SuppressWarnings("null")
    List<Semester> findAll();
}
