package com.cms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cms.entity.Documents;

public interface DocumentsRepository extends JpaRepository<Documents, Long> {
    // Additional query methods can be defined here if needed
    Documents findByStudentId(long id);

    Documents existsByStudentId(Long id);
}
