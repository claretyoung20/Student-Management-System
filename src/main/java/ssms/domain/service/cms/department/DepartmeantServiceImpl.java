package ssms.domain.service.cms.department;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ssms.domain.model.Department;
import ssms.domain.repository.cms.DepartmentRepository;;

@Service("departmentService")
public class DepartmeantServiceImpl implements DepartmentService {

	@Autowired
	DepartmentRepository departmentRepository;
	
	@Override
	public List<Department> findAll() {
		// return all department from database
		return departmentRepository.findAll();
	}

}
