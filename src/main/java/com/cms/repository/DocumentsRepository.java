package com.cms.repository;

import com.cms.entity.Documents;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface DocumentsRepository extends JpaRepository<Documents, Long> {
    // Additional query methods can be defined here if needed
    List<Documents> findByStudentId(long id);

    Documents existsByStudentId(Long id);
}
