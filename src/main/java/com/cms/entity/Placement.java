package com.cms.entity;

import jakarta.persistence.*;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import com.cms.entity.Student;

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
