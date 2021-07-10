package com.skilldistillery.homemaintenance.data;

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

}
