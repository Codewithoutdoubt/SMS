package com.cms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cms.entity.Documents;

public interface DocumentsRepository extends JpaRepository<Documents, Long> {
    Documents findByStudentId(long id);

    Documents existsByStudentId(Long id);
}
