package com.cms.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.Table;
import jakarta.persistence.Temporal;
import jakarta.persistence.TemporalType;
import lombok.Data;

@Data
@Entity
@Table(name = "tc")
public class Tc {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    @OneToOne
    @JoinColumn(name = "student_id", referencedColumnName = "id")
    private Student student;

    @Column(name = "tc_certificate_no")
    private String tcCertificateNo;

    @Column(name = "migration_certificate_no")
    private String migrationCertificateNo;

    @Column(name = "diploma_certificate_no")
    private String diplomaCertificateNo;

    @Column(name = "tc_document_submission_date")
    @Temporal(TemporalType.DATE) // Important: Only date part (not time)
    private Date tcDocumentSubmissionDate;

    @PrePersist
    public void prePersist() {
        this.tcDocumentSubmissionDate = new Date(); // Set current system date
    }

    // Getters and Setters

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getTcCertificateNo() {
        return tcCertificateNo;
    }

    public void setTcCertificateNo(String tcCertificateNo) {
        this.tcCertificateNo = tcCertificateNo;
    }

    public String getMigrationCertificateNo() {
        return migrationCertificateNo;
    }

    public void setMigrationCertificateNo(String migrationCertificateNo) {
        this.migrationCertificateNo = migrationCertificateNo;
    }

    public String getDiplomaCertificateNo() {
        return diplomaCertificateNo;
    }

    public void setDiplomaCertificateNo(String diplomaCertificateNo) {
        this.diplomaCertificateNo = diplomaCertificateNo;
    }

    
}
