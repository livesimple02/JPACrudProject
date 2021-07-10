package com.skilldistillery.homemaintenance.data;

import com.skilldistillery.homemaintenance.entities.Task;

public interface TaskDAO {

	public Task findTaskById(int id);
}
