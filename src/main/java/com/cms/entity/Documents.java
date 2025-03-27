package com.cms.entity;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Documents")
@Getter
@Setter
public class Documents {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; // Unique identifier for the student

    @Column(name = "caste", length = 50)
    private String caste;

    @Column(name = "aadhar_no", length = 12)
    private String aadharNo;

    @Column(name = "application_no", length = 20)
    private String applicationNo;

    @Column(name = "application_type", length = 50)
    private String applicationType;

    @Column(name = "application_status", length = 20)
    private String applicationStatus;

    // Constructor, if needed, can be added here
}

