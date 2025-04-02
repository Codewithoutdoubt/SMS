package com.cms.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.cms.entity.Student;

@Repository
public interface StudentRepository extends CrudRepository<Student, Integer>{
	Optional<Student> findById(Long id); 
}
