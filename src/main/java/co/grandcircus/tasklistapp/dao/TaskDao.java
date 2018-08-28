package co.grandcircus.tasklistapp.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.tasklistapp.entity.Task;
import co.grandcircus.tasklistapp.entity.User;

public interface TaskDao extends JpaRepository<Task, Long> {
		
	List<Task> findByUser(User user);
	
}