package com.lcomputerstudy.example.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.mapper.UserMapper;
@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	UserMapper userMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		User user = userMapper.readUser(username);
		user.setAuthorities(getAuthorities(username));
		
		return user;
	}
	@Override
	public Collection<GrantedAuthority> getAuthorities(String username) {
		List<GrantedAuthority> authorities = userMapper.readAuthorities(username);
		return authorities;		
	}
	@Override
	public void createUser(User user) {
		userMapper.createUser(user);
	}
	@Override
	public void createAuthorities(User user) {
		userMapper.createAuthority(user);
	}
	@Override
	public User readUser(String username) {
		return userMapper.readUser(username);
	}
	@Override
	public List<User> selectUserList(Pagination pagination) {
		System.out.println("pageNum: "+pagination.getPageNum());
		return userMapper.selectUserList(pagination);
	}
	@Override
	public int countUser() {
		return userMapper.countUser();
	}
	@Override
	public User userDetail(User user) {
		return userMapper.userDetail(user);
	}
	@Override
	public void userDelete(User user) {
		userMapper.userDelete(user);
	}
	@Override
	public void userEdit(User user) {
		userMapper.deleteAuthority(user);
		userMapper.createAuthority(user);
		userMapper.userEdit(user);
	}
	
}
