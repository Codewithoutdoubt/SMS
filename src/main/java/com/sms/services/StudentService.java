package com.sms.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sms.entity.Student;

@Service
public interface StudentService {
	Student addStudent(Student student);
	Student getStudentById(Long studentId);
	List<Student> getAllStudents();
    List<Student> getAllStudentsWithScholarships();
    List<Student> getFilteredStudents(String branchCode, String semester, String academicYear, String status);
    List<Student> getFilteredStudents(String branchCode, String semester, String academicYear, String status, String rollNo);
	List<Student> getFilteredStudentsForSc(String branchCode, String semester, String caste, String status);
	void deleteStudent(Long id);
	Student updateStudent(Student student);
	boolean studentExists(String rollNo);

	boolean studentExistsForUpdate(String rollNo, Long id);
}
