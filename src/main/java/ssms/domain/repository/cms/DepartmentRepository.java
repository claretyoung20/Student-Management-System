package ssms.domain.repository.cms;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ssms.domain.model.Department;


@Repository("departmentRepository")
public interface DepartmentRepository extends JpaRepository<Department, Integer>{

}
