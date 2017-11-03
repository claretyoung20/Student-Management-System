package ssms.domain.service.cms.student;

import java.util.List;

import ssms.domain.model.Student;

public interface StudentService {
	List<Student> findAll();
	Student getOne(String id);
	Student findByIdAndPassword(String id, String password);
} 
