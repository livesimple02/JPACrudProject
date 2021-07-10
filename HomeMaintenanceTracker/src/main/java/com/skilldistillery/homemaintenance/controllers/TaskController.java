package com.skilldistillery.homemaintenance.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.homemaintenance.data.TaskDAO;

@Controller
public class TaskController {
	
	@Autowired
	TaskDAO dao;
	
	@RequestMapping(path="/")
	public String index() {
//	  return "WEB-INF/index.jsp";
	   return "index"; // if using a ViewResolver.
	}
	
	@RequestMapping(path="getTask.do")
	public String showTask(Integer taskId, Model model) {
		model.addAttribute("task", dao.findTaskById(taskId));
		return "task/show";
	  // return "index"; // if using a ViewResolver.
	}

}
