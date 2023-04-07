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
	public String home(Model model, Pagination pagination, Search search) {	//홈
		pagination.setSearch(search);
		List<Board> list = boardservice.selectBoardList(pagination );
		model.addAttribute("list", list);
		logger.debug("debug");
		logger.info("info");
		logger.error("error");
		return "/index";
	}
	
	@RequestMapping("/user/userList")
	public String userList(Model model, Pagination pagination, Search search) {	//유저리스트
		
		
		Pagination pagi = new Pagination();
		pagi.setCount(userservice.countUser());
		pagi.setPage(pagination.getPage());
		pagi.init();
		
		List<User> list = userservice.selectUserList(pagi);

		model.addAttribute("list", list);
		model.addAttribute("pagination", pagi);
		
		return "/user/userList";
	}
	@RequestMapping("/user/userDetail/{username}")
	public String userDetail(User user, Model model) {
		user = userservice.userDetail(user);
		System.out.println("user : " + user);
		
		model.addAttribute("user", user);

		return "/user/userDetail";
	}
	@RequestMapping("/beforeSignUp")
	public String beforeSignUp() {	//유저등록
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
	@RequestMapping("/user/userDelete/{username}")
	public String userDelete(User user) {
		System.out.println("삭제: "+user);
		userservice.userDelete(user);		
		return "redirect:/user/userList";
	}
	@RequestMapping("/user/beforeEditUser/{username}")
	public String beforeUserEdit(User user, Model model) {
		System.out.println("수정-> "+user);
		model.addAttribute("user", user);
		
		return "/user/userEdit";
	}
	@RequestMapping("/user/userEdit")
	public String userEdit(User user) {
		System.out.println("수정본: " + user);
		/*
		 * 어드민이 넘어오면 role_admin 을 호출 스위치케이스문으로
		 * 
		 * */
		if(user.getCheckedAuthorities() != null && user.getCheckedAuthorities().contains(",")) {
			String[] filter = user.getCheckedAuthorities().split(",");
			user.setAuthorities(AuthorityUtils.createAuthorityList(filter[0], filter[1]));
			System.out.println("선택된권한: " + filter[0] + "," + filter[1]);
		} else {
			user.setAuthorities(AuthorityUtils.createAuthorityList(user.getCheckedAuthorities()));
			System.out.println("선택된권한: " + user.getCheckedAuthorities());
		}		
		//비밀번호 암호화
		String encodePassword = encoder.encode(user.getPassword());
		
		//유저 데이터 세팅
		user.setPassword(encodePassword);
		user.setAccountNonExpired(true);
		user.setEnabled(true);
		user.setAccountNonLocked(true);
		user.setCredentialsNonExpired(true);
		
		
		
		userservice.userEdit(user);
		return "redirect:/user/userList";
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
