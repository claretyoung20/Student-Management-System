package ssms.domain.repository.cms;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import ssms.domain.model.Request;

@Repository("requestRepository")
public interface RequestRepository extends JpaRepository<Request, Long>{
	
	List<Request> findByStudentIdAndRequestTitleIgnoreCaseContaining(String studentId,String requestTitle);
	
	List<Request> findByStudentId(String studentId);
	
	List<Request> findByDepartmentIdAndStudentId(int departmentId, String studentId);
	
	Request findByAttachmentNameIgnoreCaseContaining(String attachmentName);
}
