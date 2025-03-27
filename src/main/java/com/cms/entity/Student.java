package com.cms.entity;

import java.io.Serializable;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Data 
@Table(name = "student")
public class Student implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;  // Auto-generated primary key

    @Column(name = "rollno", nullable = false, unique = true)
    private String rollNo;  // Not auto-generated but cannot be null

    @Column(name = "sname", length = 255, nullable = false)
    private String studentName;

    @Column(name = "fname", length = 255, nullable = false)
    private String fatherName;

    @Column(name = "mobileno", nullable = true)
    private Long mobileNo;
    
    @Column(name = "admission_year", length = 10)
    private String admissionYear;
    
    @Column(name = "gmail", length = 255)
    private String email;
    
    @Column(name = "address", length = 255)
    private String address;
    
    
    @ManyToOne
    @JoinColumn(name = "branch_id", nullable = false)
    private Branch branch;
    
    @ManyToOne
    @JoinColumn(name = "semester_id", nullable = false)
    private Semester semester;

}
