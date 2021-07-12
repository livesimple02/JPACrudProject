package com.skilldistillery.homemaintenance.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Repository;

import com.skilldistillery.homemaintenance.entities.Task;

@Repository
@Transactional
public class TaskDAOImpl implements TaskDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Task findTaskById(int id) {
		return em.find(Task.class, id);
	}
	
	@Override
	public List<Task> getAllActiveTasks() {
		String jpqlQuery = "SELECT t FROM Task t WHERE t.activeFlag = TRUE ORDER BY t.nextDueDate";
		List<Task> allActiveTasks = em.createQuery(jpqlQuery, Task.class).getResultList();
		return allActiveTasks;
	}

	@Override
	public List<Task> getAllInactiveTasks() {
		String jpqlQuery = "Select t from Task t WHERE t.activeFlag = FALSE ORDER BY t.nextDueDate";
		List<Task> allInactiveTasks = em.createQuery(jpqlQuery, Task.class).getResultList();
		return allInactiveTasks;
	}

	@Override
	public Task addNewTask(Task taskToAdd) {
		em.persist(taskToAdd);
		em.flush();
		return taskToAdd;
	}

	@Override
	public Task editTask(Task taskEditedDetails, Integer taskToEditId) {
		Task taskToEdit = em.find(Task.class, taskToEditId);
		taskToEdit.setTaskName(taskEditedDetails.getTaskName());
		taskToEdit.setDescription(taskEditedDetails.getDescription());
		taskToEdit.setLastCompletedDate(taskEditedDetails.getLastCompletedDate());
		taskToEdit.setNextDueDate(taskEditedDetails.getNextDueDate());
		taskToEdit.setInstructionURL(taskEditedDetails.getInstructionURL());
		taskToEdit.setActiveFlag(taskEditedDetails.getActiveFlag());
		return taskToEdit;
	}

	@Override
	public Boolean deleteTask(Integer idToDelete) {
		Task taskToDelete = em.find(Task.class, idToDelete);
		em.remove(taskToDelete);
		return true;
	}

}
