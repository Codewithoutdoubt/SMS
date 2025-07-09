package com.sms.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.sms.entity.Branch;

import java.util.List;

@Repository
public interface BranchRepository extends JpaRepository<Branch, Long> {
    @SuppressWarnings("null")
    List<Branch> findAll();
    java.util.Optional<Branch> findByCode(String code);
}
