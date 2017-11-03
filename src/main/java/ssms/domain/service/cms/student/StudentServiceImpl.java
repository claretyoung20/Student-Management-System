package ssms.domain.service.cms.student;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssms.domain.model.Student;
import ssms.domain.repository.cms.StudentRepository;

@Service("studentService")
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentRepository studentRepository;
	 
	@Override
	public List<Student> findAll() {
		// return all student
		return studentRepository.findAll();
	}
	
	@Override
	public Student getOne(String id) {
		// return student with that id
		return studentRepository.getOne(id);
	}

	@Override
	public Student findByIdAndPassword(String id, String password) {
		// TODO Auto-generated method stub
		return studentRepository.findByIdAndPassword(id, password);
	}

}
