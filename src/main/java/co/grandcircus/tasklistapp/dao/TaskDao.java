package co.grandcircus.tasklistapp.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.tasklistapp.entity.Task;

public interface TaskDao extends JpaRepository<Task, Long> {
		
}