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

import java.time.LocalDate;

@Entity
@Table(name = "fees")
@Data
public class Fee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name = "receipt_no", nullable = false)
    private String feeReceiptNo;

    @Column(name = "amount", nullable = false)
    private Double amount;

    @Column(name = "fee_type", nullable = false)
    private String feeType;

    @Column(name = "year")
    private String year;

    @Column(name = "date")
    private LocalDate date;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    public Fee() {
    }

    public Fee(String feeReceiptNo ,Double amount, String feeType, Student student) {
        this.amount = amount;
        this.feeType = feeType;
        this.student = student;
    }
}
