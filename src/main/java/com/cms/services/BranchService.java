package com.cms.services;

import com.cms.entity.Branch;
import java.util.List;
import java.util.Optional;

public interface BranchService {
    List<Branch> getAllBranches();
    Optional<Branch> getBranchById(Long id);
    List<Branch> filterBranches(String criteria);
}
