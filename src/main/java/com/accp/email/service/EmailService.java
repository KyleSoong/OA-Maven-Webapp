package com.accp.email.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.accp.email.model.Email;
import com.accp.email.persistence.EmailMapper;
import com.accp.utils.Page;

@Service
public class EmailService {
	@Resource
	private EmailMapper emailMapper;

	// 发送（保存）邮件
	@Transactional(rollbackFor = { Exception.class, RuntimeException.class })
	public void save(Email email) {
		emailMapper.insert(email);
	}

	/*
	 * public List<Email> selectByCondition(Email email){ return
	 * emailMapper.selectByCondition(email); }
	 */
	public Email selectById(int id) {
		return emailMapper.selectById(id);
	}

	public void markRead(Integer id) {
		Map<String, Integer> condition = new HashMap<String, Integer>();
		condition.put("id", id);
		condition.put("isread", 1);
		emailMapper.updateEmail(condition);
	}

	// 获取分页后的邮件列表
	public List<Email> getEmailPage(Page page, Email email) {
		Map<String, Integer> condition = new HashMap<String, Integer>();
		condition.put("fromUser", email.getFromUser());
		condition.put("toUser", email.getToUser());
		condition.put("deleted", email.getDeleted());
		condition.put("delBySender", email.getDelBySender());
		page.setRowSum(emailMapper.getEmailSum(condition));
		page.setOffset(Page.countOffset(page.getPageSize(),
				page.getCurrentPage()));
		condition.put("offset", page.getOffset());
		condition.put("pageSize", page.getPageSize());
		return emailMapper.getEmailList(condition);
	}

	public void recover(Integer id) {
		emailMapper.updateDeleteFlag(id, 0);
	}
	//收件人移除邮件到回收站
	public void moveToTrash(Integer id) {
		emailMapper.updateDeleteFlag(id, 1);
	}
	//收件人从回收站移除邮件
	public void remove(Integer id) {
		emailMapper.updateDeleteFlag(id, 2);
		this.delFromDb(id);
	}
	//发件人从已发送移除邮件
	public void senderDel(Integer id) {
		Map<String, Integer> condition = new HashMap<String, Integer>();
		condition.put("delBySender", 1);
		condition.put("id", id);
		emailMapper.updateEmail(condition);
		this.delFromDb(id);
	}
	//如果邮件同时被收件人和发件人删除，则从数据库中删除
	public void delFromDb (Integer id){
		Email email = emailMapper.selectById(id);
		if(email.getDelBySender() == 1 && email.getDeleted() == 2){
			emailMapper.delete(id);
		}
	}

}
