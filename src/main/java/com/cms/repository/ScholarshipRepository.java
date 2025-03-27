package com.cms.repository;

import com.cms.entity.Scholarship;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScholarshipRepository extends JpaRepository<Scholarship, Long> {
    List<Scholarship> findByScholarId(Long scholarId);

    // Additional query methods (if needed) can be defined here
}
