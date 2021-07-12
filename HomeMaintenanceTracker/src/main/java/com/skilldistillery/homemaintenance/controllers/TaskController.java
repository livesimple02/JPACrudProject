package com.skilldistillery.homemaintenance.controllers;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.homemaintenance.data.TaskDAO;
import com.skilldistillery.homemaintenance.entities.Task;

@Controller
public class TaskController {

	@Autowired
	TaskDAO dao;

	@RequestMapping(path = { "/"})
	public String index(Model model, HttpSession session) {
		LocalDate today = LocalDate.now();

		List<Task> overdueTasks = new ArrayList<>();
		List<Task> sevenDayTasks = new ArrayList<>();
		List<Task> thirtyDayTasks = new ArrayList<>();
		List<Task> allActiveTasks = dao.getAllActiveTasks();
		List<Task> archivedTasks = dao.getAllInactiveTasks();

		for (int i = 0; i < allActiveTasks.size();) {
			Task task = allActiveTasks.get(i);
			if (task == null || task.getNextDueDate().isBefore(today) || task.getNextDueDate() == null) {
				overdueTasks.add(task);
				allActiveTasks.remove(task);
				continue;
			}
			if (task.getNextDueDate().minusDays(7).isBefore(today)
					|| task.getNextDueDate().minusDays(7).isEqual(today)) {
				sevenDayTasks.add(task);
				allActiveTasks.remove(task);
				continue;
			}
			if (task.getNextDueDate().minusDays(30).isBefore(today)
					|| task.getNextDueDate().minusDays(30).isEqual(today)) {
				thirtyDayTasks.add(task);
				allActiveTasks.remove(task);
				continue;
			}
			i++;
		}
		model.addAttribute("overdueTasks", overdueTasks);
		model.addAttribute("sevenDayTasks", sevenDayTasks);
		model.addAttribute("thirtyDayTasks", thirtyDayTasks);
		model.addAttribute("remainingTasks", allActiveTasks);
		model.addAttribute("archivedTasks", archivedTasks);
		return "index";
	}

	@RequestMapping(path = "addTask.do", method = RequestMethod.POST)
	public String addNewTask(String taskName, String description, String lastCompleted, String nextDue,
			String instructURL, Boolean activeFlag) {
		Task taskToAdd = new Task();
		taskToAdd.setTaskName(taskName);
		taskToAdd.setDescription(description);
		if (!lastCompleted.equals("")) {
			taskToAdd.setLastCompletedDate(LocalDate.parse(lastCompleted));
		}
		if (!nextDue.equals("")) {
			taskToAdd.setNextDueDate(LocalDate.parse(nextDue));
		}
		taskToAdd.setInstructionURL(instructURL);
		if (activeFlag == null) {
			taskToAdd.setActiveFlag(false);
		} else {
			taskToAdd.setActiveFlag(true);
		}
		dao.addNewTask(taskToAdd);
		return "redirect:/";
		// return "index"; // if using a ViewResolver.
	}

	@RequestMapping(path = "editTask.do", method = RequestMethod.POST)
	public String editTask(Integer idNum, String taskName, String description, String lastCompleted,
			String nextDue, String instructURL, Boolean activeFlag) {
		Task taskEditedDetails = new Task();
		taskEditedDetails.setTaskName(taskName);
		taskEditedDetails.setDescription(description);
		if (!lastCompleted.equals("")) {
			taskEditedDetails.setLastCompletedDate(LocalDate.parse(lastCompleted));
		}
		if (!nextDue.equals("")) {
			taskEditedDetails.setNextDueDate(LocalDate.parse(nextDue));
		}
		taskEditedDetails.setInstructionURL(instructURL);
		if (activeFlag == null) {
			taskEditedDetails.setActiveFlag(false);
		} else {
			taskEditedDetails.setActiveFlag(true);
		}
		dao.editTask(taskEditedDetails, idNum);
		return "redirect:/";
	}
	
	@RequestMapping(path="deleteTask.do", method = RequestMethod.POST)
	public String deleteTask(Integer idNumDelete) {
		System.out.println("id: " + idNumDelete);
		dao.deleteTask(idNumDelete);
		return "redirect:/";
	}

}
