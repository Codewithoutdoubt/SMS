package com.sms.entity;

import org.springframework.boot.autoconfigure.web.WebProperties.Resources.Chain.Strategy;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;


@Entity
@Data
@Table(name = "subject")
public class Subject {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "branch_id", nullable = false)
    private int branchId;

    @Column(name = "semester_id", nullable = false)
    private int semesterId;

    @Column(name = "subject_code", nullable = false, unique = true)
    private int subjectCode;

    @Column(name = "paper_code", nullable = false)
    private int paperCode;

    @Column(name = "subject_name", nullable = false)
    private String subjectName;

    public Subject() {
    }

    public Subject(int branchId, int semesterId, int subjectCode, int paperCode, String subjectName) {
        this.branchId = branchId;
        this.semesterId = semesterId;
        this.subjectCode = subjectCode;
        this.paperCode = paperCode;
        this.subjectName = subjectName;
    }
    
}