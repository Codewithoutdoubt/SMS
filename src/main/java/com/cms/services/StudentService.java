package com.cms.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cms.entity.Student;

@Service
public interface StudentService {
	Student addStudent(Student student);
	Student getStudentById(Long id);
	List<Student> getAllStudents();
    List<Student> getAllStudentsWithScholarships();
    List<Student> getFilteredStudents(String branchCode, String semester, String cast, String status);
	void deleteStudent(Long id);
	Student updateStudent(Student student);
	boolean studentExists(String rollNo);
}
