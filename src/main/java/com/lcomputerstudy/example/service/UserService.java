package com.lcomputerstudy.example.service;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.domain.User;

public interface UserService extends UserDetailsService {
	//유저 읽기
	public User readUser(String username);
	//유저 생성
	public void createUser(User user);
	//권한 생성
	public void createAuthorities(User user);
	//시큐리티 권한 얻기
	Collection<GrantedAuthority> getAuthorities(String username);
	//유저 리스트
	public List<User> selectUserList(Pagination pagination);
	//유저 카운트
	public int countUser();
	//유저상세정보
	public User userDetail(User user);
	//유저삭제
	public void userDelete(User user);
	//유저수정
	public void userEdit(User user);
}
