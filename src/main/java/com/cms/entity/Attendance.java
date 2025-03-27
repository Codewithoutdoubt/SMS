package com.cms.entity;
import java.time.LocalDate;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "attendance")
public class Attendance {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "student_id", referencedColumnName = "id", nullable = false)
    private Student student;  // Object reference, not just ID

    @Column(name = "date", nullable = false)
    private LocalDate date; // Use LocalDate

    @Column(name = "present", nullable = false)
    private boolean present;

	public Attendance(Student student, LocalDate date, boolean present, Long id) {
            super();
            this.id = id;
		this.student = student;
		this.date = date;
		this.present = present;
	}

    // Default constructor (required by JPA)
    

    }