package com.patryk.service;

import java.util.List;

import com.patryk.model.User;

public interface UserService {

	void save(User user);

	User findById(int id);

	User findBySso(String sso);

	public List<User> findAllUsers();

	public void updateUser(User user);

	public void deleteUserById(Integer id);
}