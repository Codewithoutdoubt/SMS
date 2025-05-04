package com.cms.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;

@Entity
@Table(name = "results")
@Data
public class Result {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false)
    private Double cgpa;

    @Column(nullable = false)
    private Double sgpa;

    @Column(name = "result_status", nullable = false)
    private String resultStatus;

    @Column(name = "result", nullable = false)
    private String resultValue;

    @ManyToOne
    @JoinColumn(name = "semester_id", nullable = false)
    private Semester semester;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    public Result() {
    }

    public Result(Double cgpa, Double sgpa, String resultStatus, String resultValue, Semester semester, Student student) {
        this.cgpa = cgpa;
        this.sgpa = sgpa;
        this.resultStatus = resultStatus;
        this.resultValue = resultValue;
        this.semester = semester;
        this.student = student;
    }
}
