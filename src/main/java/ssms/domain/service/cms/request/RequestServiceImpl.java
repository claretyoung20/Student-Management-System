package ssms.domain.service.cms.request;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import ssms.domain.model.Request;
import ssms.domain.repository.cms.RequestRepository;

@Service("requestService")
public class RequestServiceImpl implements RequestService {

	
	@Autowired
	RequestRepository requestRepository;

	@Override
	public List<Request> findAll() {
		
		return requestRepository.findAll();
	}

	@Override
	public List<Request> findByStudentIdAndRequestTitleIgnoreCaseContaining(String studentId, String requestTitle) {
	
		return requestRepository.findByStudentIdAndRequestTitleIgnoreCaseContaining(studentId, requestTitle);
	}

	@Override
	public List<Request> findByStudentId(String studentId) {
		
		return requestRepository.findByStudentId(studentId);
	}

	@Override
	public void saveRequest(Request request) {
		requestRepository.saveAndFlush(request);
		
	}

	@Override
	public void updateRequest(Request request) {
		requestRepository.saveAndFlush(request);
		
	}

	@Override
	public Request getOne(Long id) {
		return requestRepository.getOne(id) ;
	}

	@Override
	public List<Request> findByDepartmentIdAndStudentId(int dId, String sId) {
		return requestRepository.findByDepartmentIdAndStudentId(dId,sId);
	}

	@Override
	public Request findByAttachmentName(String fileName) {
		
		return requestRepository.findByAttachmentNameIgnoreCaseContaining(fileName);
	}
	

}
