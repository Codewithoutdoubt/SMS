package com.cms.repository;

import com.cms.entity.Documents;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DocumentsRepository extends JpaRepository<Documents, Long> {
    // Additional query methods can be defined here if needed
    Documents findByStudentId(long id);

    Documents existsByStudentId(Long id);
}
