package com.cms.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Column;
import jakarta.persistence.Table;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
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

    @ManyToOne
    @JoinColumn(name = "semester_id", nullable = false)
    private Semester semester;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    public Result() {
    }

    public Result(Double cgpa, Double sgpa, Semester semester, Student student) {
        this.cgpa = cgpa;
        this.sgpa = sgpa;
        this.semester = semester;
        this.student = student;
    }
}
