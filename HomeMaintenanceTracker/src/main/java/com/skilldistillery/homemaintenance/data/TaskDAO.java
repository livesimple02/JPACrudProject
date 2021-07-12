package com.skilldistillery.homemaintenance.data;

import java.util.List;

import com.skilldistillery.homemaintenance.entities.Task;

public interface TaskDAO {

	public Task findTaskById(int id);
	public List<Task> getAllActiveTasks();
	public Task addNewTask(Task taskToAdd);
	public Task editTask(Task taskEditedDetails, Integer taskToEditId);
	public List<Task> getAllInactiveTasks();
	public Boolean deleteTask(Integer idToDelete);
}
