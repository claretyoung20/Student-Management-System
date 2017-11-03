package ssms.domain.service.cms.request;

import java.util.List;

import ssms.domain.model.Request;

public interface RequestService {
	
	List<Request> findAll();
	
	List<Request> findByStudentIdAndRequestTitleIgnoreCaseContaining(String studentId, String title);
	
	List<Request>findByStudentId(String studentId);
	
	List<Request> findByDepartmentIdAndStudentId(int departmentId, String studentId);
	
	Request getOne(Long id);
	
	void saveRequest(Request request);
	
	void updateRequest(Request request);
	
}
