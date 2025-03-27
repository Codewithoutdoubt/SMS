package com.cms.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cms.entity.Student;

@Service
public interface StudentService {

	Student addStudent(Student student);
	Student getStudent(int id);
	List<Student> getAllStudents();

}
