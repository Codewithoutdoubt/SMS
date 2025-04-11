package com.cms.services;

import com.cms.entity.Branch;
import java.util.List;
import java.util.Optional;

public interface BranchService {
    Branch saveBranch(Branch branch);
    List<Branch> getAllBranches();
    Optional<Branch> getBranchById(Long id);
    Branch getBranchByCode(String code);
    void deleteBranch(Long id);
}
