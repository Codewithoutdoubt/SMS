package com.cms.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "document")
@Getter
@Setter
public class Documents {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Unique identifier for the student

    @OneToOne
    @JoinColumn(name = "student_id", unique = true, nullable = false) // Ensures uniqueness
    private Student student;

    @Column(name="profile_id")
    private String profileId;

    @Column(name = "aadhar_no")
    private String aadharNo;

    @Column(name = "caste_certificate_no")
    private String casteCertificateNo;

    @Column(name = "income_certificate_no")
    private String incomeCertificateNo;

    @Column(name = "residence_certificate_no")
    private String residenceCertificateNo;

}
