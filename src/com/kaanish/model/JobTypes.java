package com.kaanish.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Cacheable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
@Cacheable(false)
public class JobTypes implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue
	private int id;
	private String jobName;
	private String jobDescription;

	@OneToMany(mappedBy = "jobTypes")
	private List<JobsForDesignCostSheet> jobsForDesignCostSheets;
	
	@OneToMany(mappedBy="jobType")
	private List<JobAssignmentJobDetails> jobAssignmentJobDetails;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobDescription() {
		return jobDescription;
	}

	public void setJobDescription(String jobDescription) {
		this.jobDescription = jobDescription;
	}


	public List<JobsForDesignCostSheet> getJobsForDesignCostSheets() {
		return jobsForDesignCostSheets;
	}

	public void setJobsForDesignCostSheets(
			List<JobsForDesignCostSheet> jobsForDesignCostSheets) {
		this.jobsForDesignCostSheets = jobsForDesignCostSheets;
	}

	public List<JobAssignmentJobDetails> getJobAssignmentJobDetails() {
		return jobAssignmentJobDetails;
	}

	public void setJobAssignmentJobDetails(List<JobAssignmentJobDetails> jobAssignmentJobDetails) {
		this.jobAssignmentJobDetails = jobAssignmentJobDetails;
	}

}
