package com.skilldistillery.homemaintenance.entities;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Task {

	@Id
	@GeneratedValue (strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column (name = "task_name")
	private String taskName;
	@Column (name = "last_completed")
	private LocalDate lastCompletedDate;
	@Column (name = "next_due_date")
	private LocalDate nextDueDate;
	@Column (name = "instructions_link")
	private String instructionURL;
	
	private String description;
	private Integer interval;
	
	
	

	public Task() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTaskName() {
		return taskName;
	}

	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	
	

	public LocalDate getLastCompletedDate() {
		return lastCompletedDate;
	}

	public void setLastCompletedDate(LocalDate lastCompletedDate) {
		this.lastCompletedDate = lastCompletedDate;
	}

	public LocalDate getNextDueDate() {
		return nextDueDate;
	}

	public void setNextDueDate(LocalDate nextDueDate) {
		this.nextDueDate = nextDueDate;
	}

	public String getInstructionURL() {
		return instructionURL;
	}

	public void setInstructionURL(String instructionURL) {
		this.instructionURL = instructionURL;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getInterval() {
		return interval;
	}

	public void setInterval(Integer interval) {
		this.interval = interval;
	}

	@Override
	public String toString() {
		return "Task [id=" + id + ", taskName=" + taskName + ", lastCompletedDate=" + lastCompletedDate
				+ ", nextDueDate=" + nextDueDate + ", instructionURL=" + instructionURL + ", description=" + description
				+ ", interval=" + interval + "]";
	}
	
	
	
}
