package com.cms.controller;

import com.cms.entity.Branch;
import com.cms.services.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/branches")
public class BranchController {

    @Autowired
    private BranchService branchService;

    @GetMapping("/list")
    public String listBranches(Model model) {
        List<Branch> branches = branchService.getAllBranches();
        model.addAttribute("branchList", branches);
        return "branch-list"; // 
    }

    @GetMapping("/add")
    public String showAddBranchForm(Model model) {
        model.addAttribute("branch", new Branch());
        return "add-branch"; // Redirects to addBranch.jsp
    }

    @PostMapping("/save")
    public String saveBranch(@ModelAttribute Branch branch) {
        branchService.saveBranch(branch);
        return "redirect:/branches/list"; // Redirects to branch list
    }

    @GetMapping("/edit/{id}")
    public String editBranch(@PathVariable Long id, Model model) {
        Optional<Branch> branch = branchService.getBranchById(id);
        if (branch.isPresent()) {
            model.addAttribute("branch", branch.get());
            return "editBranch"; // Redirects to editBranch.jsp
        }
        return "redirect:/branches/list"; // Redirects if not found
    }
}
