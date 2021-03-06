package com.patryk.dao;

import java.util.List;

import com.patryk.model.User;

public interface UserDao {

	void save(User user);

	User findById(int id);

	User findByUsername(String username);

	public List<User> findAllUsers();

	public void deleteUserById(Integer id);
}
