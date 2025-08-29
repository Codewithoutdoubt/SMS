package com.sms.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import org.springframework.data.domain.Sort;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sms.entity.Student;
import com.sms.entity.Subject;
import com.sms.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentRepository studentRepository;

    @Autowired
    private TcService tcService;

    @Autowired
    private DocumentsService documentsService;

    @Autowired
    private ScholarshipService scholarshipService;

    @Autowired
    private FeeService feeService;

    @Autowired
    private ResultService resultService;

    @Autowired
    private PlacementService placementService;

    @Override
    public Student addStudent(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        studentRepository.findAll(Sort.by(Sort.Direction.DESC, "id")).forEach(students::add);
        return students;
    }

    @Override
    public int getBranchIdByStudentId(Long studentId) {
        return studentRepository.findBranchIdByStudentId(studentId);
    }

    @Override
    public Student getStudentByStudentId(Long studentId) {
        return studentRepository.findByStudentId(studentId);
    }

    @Override
    public void deleteStudent(Long id) {
        // Delete dependent Tc records first
        tcService.deleteTcByStudentId(id);
        // Delete dependent Documents
        documentsService.deleteDocumentsByStudentId(id);
        // Delete dependent Scholarships
        scholarshipService.deleteScholarshipsByStudentId(id);
        // Delete dependent Fees
        feeService.deleteFeesByStudentId(id);
        // Delete dependent Results
        resultService.deleteResultsByStudentId(id);

        // Delete dependent Placements
        placementService.deletePlacementsByStudentId(id);

        // Then delete the student
        studentRepository.deleteById(id);
    }

    @Override
    public Student updateStudent(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public List<Student> getAllStudentsWithScholarships() {
        return studentRepository.findAllWithScholarships();
    }

    @Override
    public List<Student> getFilteredStudentsForSc(String branchCode, String semester, String caste, String status) {
        // First get all students with scholarships
        List<Student> students = studentRepository.findAllWithScholarships();

        // Apply filters
        return students.stream()
                .filter(student -> (branchCode == null || branchCode.isEmpty() ||
                        student.getBranch().getCode().equals(branchCode)))
                .filter(student -> (semester == null || semester.isEmpty() ||
                        student.getSemester().getName().equals(semester)))
                .filter(student -> (caste == null || caste.isEmpty() ||
                        student.getCaste().equals(caste)))
                .filter(student -> (status == null || status.isEmpty() ||
                        (status.equals("Applied") && !student.getScholarships().isEmpty()) ||
                        (status.equals("Not Applied") && student.getScholarships().isEmpty())))
                .collect(Collectors.toList());
    }

    @Override
    public List<Student> getFilteredStudents(String branchCode, String semester, String academicYear, String status,
            String rollNo) {
        // First get all students with scholarships
        List<Student> students = studentRepository.findAllWithScholarships();

        // Apply filters
        return students.stream()
                .filter(student -> (branchCode == null || branchCode.isEmpty() ||
                        student.getBranch().getCode().equals(branchCode)))
                .filter(student -> (semester == null || semester.isEmpty() ||
                        student.getSemester().getName().equals(semester)))
                .filter(student -> (academicYear == null || academicYear.isEmpty() ||
                        student.getAdmissionYear().equals(academicYear)))
                .filter(student -> (status == null || status.isEmpty() ||
                        (status.equals("Applied") && !student.getScholarships().isEmpty()) ||
                        (status.equals("Not Applied") && student.getScholarships().isEmpty())))
                .filter(student -> (rollNo == null || rollNo.isEmpty() ||
                        student.getRollNo().equalsIgnoreCase(rollNo)))
                .collect(Collectors.toList());
    }

    @Override
    public boolean studentExists(String rollNo) {
        return studentRepository.findByRollNo(rollNo) != null;
    }

    @Override
    public boolean studentExistsForUpdate(String rollNo, Long id) {
        return studentRepository.findByRollNoAndIdNot(rollNo, id) != null;
    }

    @Override
    public List<Student> getFilteredStudents(String branchCode, String semester, String academicYear, String status) {
        List<Student> students = studentRepository.findAllWithScholarships();

        // Apply filters
        return students.stream()
                .filter(student -> (branchCode == null || branchCode.isEmpty() ||
                        student.getBranch().getCode().equals(branchCode)))
                .filter(student -> (semester == null || semester.isEmpty() ||
                        student.getSemester().getName().equals(semester)))
                .filter(student -> (academicYear == null || academicYear.isEmpty() ||
                        student.getAdmissionYear().equals(academicYear)))
                .filter(student -> (status == null || status.isEmpty() ||
                        (status.equals("Applied") && !student.getScholarships().isEmpty()) ||
                        (status.equals("Not Applied") && student.getScholarships().isEmpty())))
                .collect(Collectors.toList());

    }

    @Override
    public List<Subject> getSubjectByBranchAndSemester(Integer branchId, Integer semesterId) {
        // TODO Auto-generated method stub
        throw new UnsupportedOperationException("Unimplemented method 'getSubjectByBranchAndSemester'");
    }

}
