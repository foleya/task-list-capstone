package co.grandcircus.tasklistapp.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import co.grandcircus.tasklistapp.entity.User;

public interface UserDao extends JpaRepository<User, Long> {
		
		// We can add specific query methods.
		// Simply by the method name, Spring knows what JPQL query to use.
//		List<User> findAllByOrderByName();
		
		User findByEmailAddress(String emailAddress);
		

}