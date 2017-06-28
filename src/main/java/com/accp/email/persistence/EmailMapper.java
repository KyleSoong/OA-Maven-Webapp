package com.accp.email.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.accp.email.model.Email;

public interface EmailMapper {
	public void insert(Email email);
//	public List<Email> selectByCondition(Email email);
	public List<Email> getEmailList(Map<String,Integer> condition);
	public int getEmailSum(Map<String, Integer> condition);
	public Email selectById(int id);
	public void updateEmail(Map<String, Integer> condition);
	public void updateDeleteFlag(@Param("id") Integer id, @Param("deleted") Integer deleted);
	public void delete(Integer id);
}
