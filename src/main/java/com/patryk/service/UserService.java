package com.patryk.service;

import java.util.List;

import com.patryk.model.User;

public interface UserService {
//korzysta z dao
	void save(User user);

	User findById(int id);

	User findBySso(String sso);

	public List<User> findAllUsers();
}