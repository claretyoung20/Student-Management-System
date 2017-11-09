package ssms.domain.model;

import java.io.Serializable;
import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "request")
public class Request implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@Column(name = "id")
	@Min(1)
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;

	@Column(name = "request_title")
	private String requestTitle;

	@Column(name = "date_created")
	private Date dateCreated;

	@Column(name = "data_close")
	private Date dataClose;

	@ManyToOne
	private Staff staff;

	@ManyToOne
	private Student student;

	@ManyToOne
	private Department department;

	@Column(name = "request_content")
	private String requestContent;

	@Column(name = "request_status")
	private int requestStatus;

	@Column(name = "request_solution")
	private String requestSolution;

	@Column(name = "attachment_name")
	private String attachmentName;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@NotEmpty
	@NotNull
	@NotBlank
	public String getRequestTitle() {
		return requestTitle;
	}

	public void setRequestTitle(String requestTitle) {
		this.requestTitle = requestTitle;
	}

	public Date getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

	public Date getDataClose() {
		return dataClose;
	}

	public void setDataClose(Date dataClose) {
		this.dataClose = dataClose;
	}

	public Staff getStaff() {
		return staff;
	}

	public void setStaff(Staff staff) {
		this.staff = staff;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@NotEmpty
	@NotNull
	@NotBlank
	public String getRequestContent() {
		return requestContent;
	}

	public void setRequestContent(String requestContent) {
		this.requestContent = requestContent;
	}

	public int getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(int requestStatus) {
		this.requestStatus = requestStatus;
	}

	public String getRequestSolution() {
		return requestSolution;
	}

	public void setRequestSolution(String requestSolution) {
		this.requestSolution = requestSolution;
	}

	public String getAttachmentName() {
		return attachmentName;
	}

	public void setAttachmentName(String attachmentName) {
		this.attachmentName = attachmentName;
	}

}
