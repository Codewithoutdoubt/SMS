package com.sms.entity;

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

    @Column(name = "aadhar_no")
    private String aadharNo;


    @Column(name = "aadhar_img")
    private String aadharImage;

    @Column(name = "cast_certificate_no")
    private String castCertificateNo;

    @Column(name = "cast_certificate_img")
    private String castCertificateImage;

    @Column(name = "residence_certificate_no")
    private String residenceCertificateNo;

    @Column(name = "residence_certificate_img")
    private String residenceCertificateImage;

    @Column(name = "income_certificate_no")
    private String incomeCertificateNo;

    @Column(name = "income_certificate_img")
    private String incomeCertificateImage;

    @Column(name = "ssc_marksheet_no")
    private String sscMarksheetNo;

    @Column(name = "ssc_marksheet_img")
    private String sscMarksheetImage;

    @Column(name = "leaving_certificate_no")
    private String leavingCertificateNo;

    @Column(name = "leaving_certificate_img")
    private String leavingCertificateImage;

}
