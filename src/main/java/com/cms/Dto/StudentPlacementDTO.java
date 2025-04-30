package com.cms.Dto;
import com.cms.entity.Student;
public class StudentPlacementDTO {
    private Student student;
    private String companyName;
    private double packageAmount;

    public StudentPlacementDTO(Student student, String companyName, double packageAmount) {
        this.student = student;
        this.companyName = companyName;
        this.packageAmount = packageAmount;
    }

    public Student getStudent() {
        return student;
    }

    public String getCompanyName() {
        return companyName;
    }

    public double getPackageAmount() {
        return packageAmount;
    }
}