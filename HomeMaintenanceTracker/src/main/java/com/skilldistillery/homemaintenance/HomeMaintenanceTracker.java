package com.skilldistillery.homemaintenance;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan ("com.skilldistillery.homemaintenance")
public class HomeMaintenanceTracker {

	public static void main(String[] args) {
		SpringApplication.run(HomeMaintenanceTracker.class, args);
	}

}
