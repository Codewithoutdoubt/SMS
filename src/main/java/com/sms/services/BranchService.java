package com.sms.services;

import java.util.List;
import java.util.Optional;

import com.sms.entity.Branch;

public interface BranchService {
    List<Branch> getAllBranches();
    Optional<Branch> getBranchById(Long id);
    List<Branch> filterBranches(String criteria);
    void saveBranch(Branch branch);
}
