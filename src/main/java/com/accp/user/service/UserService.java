package com.accp.user.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.accp.user.model.User;
import com.accp.user.persistence.UserMapper;

@Service
public class UserService {

	@Resource
	private UserMapper userMapper;

	public User login(String userName, String pwd) {
		List<User> list = userMapper.getUserByName(userName);
		if(list.size()==0) return null;
		if(list.get(0).getPwd().equals(pwd)){
			return (User)list.get(0);
		} 
		return null;
	}

	public Integer register(User user) {
		return userMapper.insert(user);
	}
	
	public List<User> getUserList() {
		return userMapper.getUserList();
	}

	public void update(User u) {
		userMapper.update(u);		
	}

	public List<User> getUserById(int id) {
		return userMapper.getUserById(id);		
	}

}
