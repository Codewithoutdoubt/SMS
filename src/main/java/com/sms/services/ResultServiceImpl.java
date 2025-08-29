package com.sms.services;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.entity.Result;
import com.sms.entity.SubjectMark;
import com.sms.repository.ResultRepository;

@Service
public class ResultServiceImpl implements ResultService {
    @Autowired
    private  ResultRepository resultRepository;

    @Override
    public List<Result> getResultsByStudentId(Long studentId) {
        return resultRepository.findByStudentId(studentId);
    }
    @Override
    public void deleteById(Long id) {
        resultRepository.deleteById(id);
    }
    @Override
    public List<Result> findAll() {
        return resultRepository.findAll();
    }

    @Override
    public void saveResult(Result result) {
        Result existingResult = resultRepository.findByStudentIdAndSemesterId(result.getStudent().getId(), result.getSemester().getId());
        if (existingResult != null) {
 throw new IllegalArgumentException("Result for this student and semester already exists. Please go to the edit page to update the result.");
        }

        if (result.getSubjects() != null) {
            for (SubjectMark subjectMark : result.getSubjects()) {
                subjectMark.setResult(result);
            }
        }

        // Calculate CGPA
        Result lastResult = resultRepository.findTopByStudentIdOrderByIdDesc(result.getStudent().getId());

        if (lastResult == null) {
            // This is the first result for the student. CGPA is the same as SGPA.
            result.setCgpa(result.getSgpa());
        } else {
            // There are previous results, calculate the new cumulative GPA.
            double lastCgpa = lastResult.getCgpa();
            // Assuming semester IDs are sequential and represent the count of semesters (1, 2, 3...).
            long currentSemesterNumber = result.getSemester().getId();
            long previousSemesterCount = currentSemesterNumber - 1;

            double newCgpa = ((lastCgpa * previousSemesterCount) + result.getSgpa()) / currentSemesterNumber;
            result.setCgpa(Math.round(newCgpa * 100.0) / 100.0);
        }
        resultRepository.save(result);
    }

    public void deleteResultsByStudentId(Long studentId){
        resultRepository.findByStudentId(studentId).forEach(result -> resultRepository.deleteById(result.getId()));
    }

}
