package com.cms.repository;

import com.cms.entity.Branch;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BranchRepository extends JpaRepository<Branch, Long> {
    // You can add custom query methods if needed
	Branch findByCode(String code); 
}
