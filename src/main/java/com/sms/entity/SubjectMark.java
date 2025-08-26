package com.sms.entity;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "subject_marks")
@Data
public class SubjectMark {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // Pass/Fail
    @Column(nullable = false)
    private String status;

    @ManyToOne
    @JoinColumn(name = "subject_id", nullable = false)
    private Subject subject;

    @ManyToOne
    @JoinColumn(name = "result_id", nullable = false)
    private Result result;
}
