package com.cms.services;
import com.cms.entity.Branch;
import com.cms.repository.BranchRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class BranchServiceImpl implements BranchService {
    
    @Autowired
    private BranchRepository branchRepository;
    
    @Override
    public Branch saveBranch(Branch branch) {
        return branchRepository.save(branch);
    }
    
    @Override
    public List<Branch> getAllBranches() {
        return branchRepository.findAll();
    }
    
    @Override
    public Optional<Branch> getBranchById(Long id) {
        return branchRepository.findById(id);
    }

	@Override
	public Branch getBranchByCode(String code) {
		return null;
	}
    
}
