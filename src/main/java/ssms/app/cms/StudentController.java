package ssms.app.cms;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.rmi.CORBA.UtilDelegate;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ssms.domain.model.Department;
import ssms.domain.model.Request;
import ssms.domain.model.Student;
import ssms.domain.service.cms.department.DepartmentService;
import ssms.domain.service.cms.request.RequestService;
import ssms.domain.service.cms.student.StudentService;

@Controller
public class StudentController {
	
	@Autowired
	StudentService studentService;
	
	@Autowired
	DepartmentService departmentService;
	
	@Autowired 
	RequestService requestService;

//	Home page
	@RequestMapping(value="/")
	public String home(HttpSession session, Model model) {
		if(SessionValidate(session,model) != null) {
			return "student/studentLogin";
		}
		
		return "student/home";
	}
	
//	Login
	@GetMapping(value="/studentLogin")
	public String login(HttpSession session) {
		
		session.removeAttribute("student");
		return "student/studentLogin";
	}
	
	@PostMapping(value="/studentLogin")
	public String getLogin(@ModelAttribute("student") Student student, HttpSession session) {
		//make sure the user entered a value
		if(student.getId().isEmpty()) {
			return "student/studentLogin";
		}else if(student.getPassword().isEmpty()) {
			return "student/studentLogin";
		}
		
		
		//check if there is a student with the information
		Student loginStudent = null;
		loginStudent = studentService.findByIdAndPassword(student.getId(), student.getPassword());
		if(loginStudent == null) {
			return "student/studentLogin";
		}
		
		//Save to session
		session.setAttribute("student", student);
			 
		return "redirect:/";
	}
	
//	make request
	@RequestMapping(value="/request")
	public String makeRequest( HttpSession session, Model model) {
	
		if(SessionValidate(session, model)!=null) {
			return "student/studentLogin";
		}
		
		//date
		Date date = new Date(new java.util.Date().getTime());
		String today = date.toString();
		model.addAttribute("date",today);
		
		return "student/makeRequest";
	}

/**
 * @param session
 * @param model
 */
	private String SessionValidate(HttpSession session, Model model) {
	Student studentSession = (Student)session.getAttribute("student");
	if(studentSession == null) {
		return "student/studentLogin";
	}
	System.out.println("Session info = "+ studentSession.getId());
	
	//get Student Info
	Student studentInfo = studentService.getOne(studentSession.getId());
	model.addAttribute("student", studentInfo);
	
	List<Department> department = departmentService.findAll();	
	model.addAttribute("department",department);
	
	return null;
}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	public String allRequest(@ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		if(SessionValidate(session,model) != null) {
			return "student/studentLogin";
		}
		
		List<Request> getAllRequest = requestService.findByStudentId(getStudentId(session));
		model.addAttribute("request", getAllRequest);
		
		return "student/searchRequest";
	}

	@RequestMapping(value="/view", method=RequestMethod.POST)
	public String addRequest(@ModelAttribute("request") Request request, HttpSession session, Model model) {
		
		if(SessionValidate(session,model) != null) {
			return "student/studentLogin";
		}
		
		List<Request> getAllRequest = requestService.findByStudentId(getStudentId(session));
		model.addAttribute("request", getAllRequest);
		
		Request getRequestData = new Request();
		getRequestData.setRequestTitle(request.getRequestTitle());
		getRequestData.setDateCreated(request.getDateCreated());
		getRequestData.setDataClose(null);
		getRequestData.setStaff(null);
		
		Student student1 = (Student)session.getAttribute("student");
		getRequestData.setStudent(student1);
		
		Department department1 = new Department();
		department1.setId(request.getId().intValue());
		
		if(department1.getId() == 0) {
			return "student/makeRequest";
		}
		getRequestData.setDepartment(department1);
		getRequestData.setRequestContent(request.getRequestContent());
		getRequestData.setRequestStatus(0);
		getRequestData.setRequestSolution(null);
		getRequestData.setAttachmentName(null);
		
	
		requestService.saveRequest(getRequestData);
		
		return "redirect:/view";
	}
	
	@RequestMapping(value="/view/{id}")
	public String viewRequest(HttpSession session, Model model, @PathVariable Long id) {
		
		if(SessionValidate(session,model) != null) {
			return "student/studentLogin";
		}
		
		Request requestDetail = requestService.getOne(id);
		model.addAttribute("request", requestDetail);
		
		return "student/viewRequest";
	}
	
	@RequestMapping(value="/views", method=RequestMethod.POST)
	public String viewRequestWithTitle(HttpSession session, Model model, @RequestParam String requestTitle) {
		
		if(SessionValidate(session,model) != null) {
			return "student/studentLogin";
		}
		
		List<Request> requestDetail = requestService.findByStudentIdAndRequestTitleIgnoreCaseContaining(getStudentId(session),requestTitle);
		model.addAttribute("request", requestDetail);
		
		return "student/searchRequest";
	}
	
	@RequestMapping(value="/viewss", method=RequestMethod.POST)
	public String viewRequestWithDept(HttpSession session, Model model, @RequestParam int searchR) {
		
		if(SessionValidate(session,model) != null) {
			return "student/studentLogin";
		}
		if(searchR == 0) {
			List<Request> requestDetail = requestService.findByStudentId(getStudentId(session));
			model.addAttribute("request", requestDetail);
			
			model.addAttribute("selectedId", searchR);
			model.addAttribute("selected", "selected");
			
			return "student/searchRequest";
		}
		
		model.addAttribute("selectedId", searchR);
		model.addAttribute("selected", "selected");
		List<Request> requestDetail = requestService.findByDepartmentIdAndStudentId(searchR, getStudentId(session));
		model.addAttribute("request", requestDetail);
		
		return "student/searchRequest";
	}

	@GetMapping(value="/student/all")
	public @ResponseBody List<Student> allStudent(){
		return studentService.findAll();
	}
	
	public String getStudentId(HttpSession session) {
		Student studentSession = (Student)session.getAttribute("student");
		if(studentSession == null) {
			return "student/studentLogin";
		}
		return studentSession.getId();
		
	}
	
	
	
}
