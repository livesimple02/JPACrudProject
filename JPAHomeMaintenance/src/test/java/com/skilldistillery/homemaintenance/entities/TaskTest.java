package com.skilldistillery.homemaintenance.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;

import java.time.LocalDate;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class TaskTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Task task;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("HomeMaintenance");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		task = em.find(Task.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_Task_entity_mapping() {
		assertNotNull(task);
		assertEquals("Refrigerator Water Filter", task.getTaskName());
		assertEquals("Replace Water Filter", task.getDescription());
		assertEquals(180, task.getInterval());
		assertEquals(LocalDate.of(2021, 2, 12), task.getLastCompletedDate());
		assertEquals(LocalDate.of(2021, 8, 11), task.getNextDueDate());
		assertNull(task.getInstructionURL());
		
	}

}
