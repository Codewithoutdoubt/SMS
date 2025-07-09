package com.sms.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.sms.entity.Documents;

public interface DocumentsRepository extends JpaRepository<Documents, Long> {
    Documents findByStudentId(long id);
    Documents existsByStudentId(Long id);
}
