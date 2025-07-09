package com.sms.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "placement")
@Data
@Getter
@Setter
public class Placement {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name="student_id", nullable = false)
    private Student student;

    @Column(name = "company_name", nullable = false)
    private String companyName;

    @Column(name = "package", nullable = false)
    private double packageAmount;

    @Column(name = "selected_year", nullable = false)
    private Integer selectedYear;

    public Placement() {
    }

    public Placement(Student student, String companyName, double packageAmount, Integer selectedYear) {
        this.student = student;
        this.companyName = companyName;
        this.packageAmount = packageAmount;
        this.selectedYear = selectedYear;
    }

}
