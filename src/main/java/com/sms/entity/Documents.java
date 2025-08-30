package com.sms.entity;

import java.util.Base64;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
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

    @Lob
    @Column(name = "aadhar_img", columnDefinition = "LONGBLOB")
    private byte[] aadharImage;

    @Column(name = "cast_certificate_no")
    private String castCertificateNo;

    @Lob
    @Column(name = "cast_certificate_img", columnDefinition = "LONGBLOB")
    private byte[] castCertificateImage;

    @Column(name = "residence_certificate_no")
    private String residenceCertificateNo;

    @Lob
    @Column(name = "residence_certificate_img", columnDefinition = "LONGBLOB")
    private byte[] residenceCertificateImage;

    @Column(name = "income_certificate_no")
    private String incomeCertificateNo;

    @Lob
    @Column(name = "income_certificate_img", columnDefinition = "LONGBLOB")
    private byte[] incomeCertificateImage;

    @Column(name = "tenth_marksheet_no")
    private String tenthMarksheetNo;

    @Lob
    @Column(name = "tenth_marksheet_img", columnDefinition = "LONGBLOB")
    private byte[] tenthMarksheetImage;

    @Column(name = "twelfth_marksheet_no")
    private String twelfthMarksheetNo;

    @Lob
    @Column(name = "twelfth_marksheet_img", columnDefinition = "LONGBLOB")
    private byte[] twelfthMarksheetImage;

    @Column(name = "transfer_certificate_no")
    private String transferCertificateNo;

    @Lob
    @Column(name = "transfer_certificate_img", columnDefinition = "LONGBLOB")
    private byte[] transferCertificateImage;

    @Lob
    @Column(name = "profile_img", columnDefinition = "LONGBLOB")
    private byte[] profileImage;

    
}