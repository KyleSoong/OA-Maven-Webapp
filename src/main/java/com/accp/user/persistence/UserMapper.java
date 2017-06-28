package com.accp.user.persistence;

import java.util.List;

import com.accp.user.model.User;

public interface UserMapper {
	public Integer insert(User user);
	public List<User> getUserByName(String userName);
	public void delete(int id);
	public List<User> getUserList();
	public void update(User u);
	public List<User> getUserById(int id);
}
