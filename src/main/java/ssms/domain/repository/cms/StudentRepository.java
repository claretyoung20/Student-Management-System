package ssms.domain.repository.cms;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ssms.domain.model.Student;

@Repository("studentRepository")
public interface StudentRepository extends JpaRepository<Student, String> {
	
	Student findByIdAndPassword(String id, String password);
}
