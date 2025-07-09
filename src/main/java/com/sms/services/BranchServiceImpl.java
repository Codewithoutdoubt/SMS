package com.sms.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.entity.Branch;
import com.sms.exception.DuplicateBranchCodeException;
import com.sms.repository.BranchRepository;

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

    @Override
    public void saveBranch(Branch branch) {
        if (branch != null) {
            if (branchRepository.findByCode(branch.getCode()).isPresent()) {
                throw new DuplicateBranchCodeException("Branch code " + branch.getCode() + " is already in use.");
            }
            branchRepository.save(branch);
        }
    }
}
