package com.lcomputerstudy.example.controller;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lcomputerstudy.example.domain.Board;
import com.lcomputerstudy.example.domain.Pagination;
import com.lcomputerstudy.example.domain.Search;
import com.lcomputerstudy.example.domain.User;
import com.lcomputerstudy.example.service.BoardService;
import com.lcomputerstudy.example.service.UserService;

@org.springframework.stereotype.Controller
public class UserController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService boardservice;
	@Autowired UserService userservice;
	@Autowired PasswordEncoder encoder;

	@RequestMapping("/")
	public String home(Model model, Pagination pagination, Search search) {
		pagination.setSearch(search);
		List<Board> list = boardservice.selectBoardList(pagination );
		model.addAttribute("list", list);
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		return "/index";
	}
	
	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {
		return "/signup";
	}
	@RequestMapping("/signup")
	public String signup(User user) {
		//비밀번호 암호화
		String encodePassword = encoder.encode(user.getPassword());
		
		//유저 데이터 세팅
		user.setPassword(encodePassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		user.setAuthorities(AuthorityUtils.createAuthorityList("ROLE_USER"));
		//유저 생성
		userservice.createUser(user);
		//유저 권한 생성
		userservice.createAuthorities(user);
	
		return "/login";
	
	}
	
	@RequestMapping(value="/login")
	public String beforeLogin(HttpServletRequest request, Model model) {
		
		String url = request.getHeader("Referer");
		if(url != null && !url.contains("/login")) {
			request.getSession().setAttribute("prevPage", url);
		}
		return "/login";
	}
	
	@Secured({"ROLE_ADMIN"}) 
		@RequestMapping(value="/admin")
		public String admin(Model model) {
			return "/admin";
		}
	@Secured({"ROLE_USER"})
	   @RequestMapping(value="/user/info")
	   public String userInfo(Model model) {
	      
	      return "/user_info";
	   }	
	@RequestMapping(value="denied") 
	public String denied(Model model) {
		return "/denied";
	}
	
	
}
