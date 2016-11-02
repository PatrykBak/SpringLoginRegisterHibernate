package com.patryk.dao;

import java.util.List;

import com.patryk.model.UserProfile;

public interface UserProfileDao {

	List<UserProfile> findAll();

	UserProfile findById(int id);

	UserProfile findByType(String type);
}
