package com.lcomputerstudy.example.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.security.core.GrantedAuthority;

import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.domain.User;

@Mapper
public interface UserMapper {
	//유저읽기
	public User readUser(String username);
	
	//유저생성
	public void createUser(User user);
	
	//권한읽기
	public List<GrantedAuthority> readAuthorities(String username);
	
	//권한생성
	public void createAuthority(User user);
	//권한삭제
	public void deleteAuthority(User user);
	//유저리스트
	public List<User> selectUserList(Pagination pagination);
	
	//유저카운트
	public int countUser();
	
	//유저상세정보
	public User userDetail(User user);
	
	//유저삭제
	public void userDelete(User user);
	
	//유저수정
	public void userEdit(User user);
}
