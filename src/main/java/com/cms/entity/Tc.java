package com.cms.entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

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
