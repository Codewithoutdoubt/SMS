
package com.cms.controller;

import com.cms.entity.Branch;
import com.cms.entity.Department;
import com.cms.services.BranchService;
import com.cms.exception.DuplicateBranchCodeException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.Optional;

@Controller
@RequestMapping("/branch-data")
public class BranchController {

    @Autowired
    private BranchService branchService;

    @ModelAttribute("department")
    public Department populatedCommonObject() {
        Department obj = new Department();
        obj.setName("Admin Panel");
        return obj;
    }

    @RequestMapping
    public ModelAndView listBranches() {
        ModelAndView mav = new ModelAndView("Admin/branch-list");
        mav.addObject("branchList", branchService.getAllBranches());
        return mav;
    }

    @GetMapping("/add")
    public String showAddBranchForm(Model model) {
        model.addAttribute("branch", new Branch());
        return "Admin/add-branch"; // Redirects to addBranch.jsp
    }

    @PostMapping("/save")
    public String saveBranch(@ModelAttribute Branch branch, Model model) {
        try {
            branchService.saveBranch(branch);
        } catch (DuplicateBranchCodeException e) {
            model.addAttribute("error", e.getMessage());
            return "Admin/add-branch";
        }
        return "redirect:/branch-data"; // Redirects to branch list
    }

    @GetMapping("/edit/{id}")
    public String editBranch(@PathVariable Long id, Model model) {
        Optional<Branch> branch = branchService.getBranchById(id);
        if (branch.isPresent()) {
            model.addAttribute("branch", branch.get());
            return "Admin/add-branch"; // Reuse add-branch.jsp for editing
        }
        return "redirect:/branches"; // Redirects if not found
    }

}
