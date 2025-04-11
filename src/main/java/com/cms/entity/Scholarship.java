package com.cms.entity;

import java.io.Serializable;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "scholarship")
public class Scholarship implements Serializable {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "scholarship_id")
    private Long scholarshipId;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    @Column(name = "application_no", nullable = false, unique = true)
    private String applicationNo;

    @Column(name = "application_type", length = 255, nullable = false)
    private String applicationType;

    @Column(name = "academic_year", length = 10, nullable = false)
    private String academicYear;

    @Column(name = "scholar_id", nullable = false)
    private String scholarId;

    @Column(name = "entitlement_amount", nullable = false)
    private Double entitlementAmount;

    @Column(name = "application_status", length = 50, nullable = false)
    private String applicationStatus;
}
