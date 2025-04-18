package com.cms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.cms.entity.Branch;
import com.cms.repository.BranchRepository;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class BranchServiceImpl implements BranchService {

    @Autowired
    private BranchRepository branchRepository;

    @Override
    public List<Branch> getAllBranches() {
        return branchRepository.findAll();
    }

    @Override
    public Optional<Branch> getBranchById(Long id) {
        return branchRepository.findById(id);
    }

    @Override
    public List<Branch> filterBranches(String criteria) {
        List<Branch> branches = branchRepository.findAll();
        return branches.stream()
            .filter(branch -> branch.getName().contains(criteria) || branch.getCode().contains(criteria))
            .collect(Collectors.toList());
    }
}
