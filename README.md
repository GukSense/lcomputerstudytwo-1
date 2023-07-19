# Spring MVC 게시판
> spring boot 를 이용한 SpringMVC 게시판

</br>

## 1. 제작 기간 & 참여인원
- 2023.3.13~ 2023.5.03
- 개인 프로젝트
</br>

## 2. 사용 기술

### `Back-End`
  - HTML/CSS 
  - JavaScript
  - Java(JDK1.8)
  - Mybatis2.3
  - SpringSecurity
  - MariaDB
  - SpringFramework 2.7.7

## 3.ERD 설계 

![Spring MVC Board](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/d19531b9-749b-4094-8c19-512f16bce715)

## 4.핵심기능
이 게시판의 핵심 기능은 정렬 & 검색 기능 입니다.
<details>
<summary><b>핵심 기능 설명 펼치기</b></summary>
<div markdown="1">

### 전체 흐름
![설계도](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/9da8b872-b5b1-4c64-860e-a41070b6c41c)

### 4-1. VIEW
- 게시판 리스트에서 탭 클릭시 정렬 [코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/webapp/WEB-INF/views/board/boardList.jsp#L36)
 - view 화면단에서 카테고리를 클릭 할시 카테고리 data를 url에 담아서 보냅니다.
- 게시판 리스트에서 검색 할 데이터요청 [코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/webapp/WEB-INF/views/board/boardList.jsp#L79)
 -  form 태그를 통해 data를 요청

### 4-2 Controller
- 요청처리 [코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/java/com/lcomputerstudy/example/controller/BoardController.java#L31)
 - 컨트롤러는 요청받은 데이터를 pagination 객체에 담아서 service 로직으로 보냅니다.

### 4-3 Service
- 서비스는 controller 에서 넘겨받은 pagination 객체를 mapper 로 넘겨줍니다. [코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/java/com/lcomputerstudy/example/service/BoardServiceImpl.java#L22)

### 4-4 Mapper 
- Mapper 는 mybatis 를 사용하여 xml로 쿼리르 분리해주었습니다. [코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/resources/mapper/BoardMapper.xml#L27)
 - db 데이터가 담긴 자바객체를 다시 model 을통해 viewResolver 로 data를 처리합니다. [코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/java/com/lcomputerstudy/example/controller/BoardController.java#L49)

	<details>
	<summary><b>주요기능 서비스 실행 모습</b></summary>
		### 회원가입 및 로그인 서비스 기능 
		
 			
 	</div>
	</details>
</div>
</details>
	
## 문제와해결
- 사용자가 게시판을 이용할때 본인이 원하는 정보만 필터해서 보길 원할 경우가 분명 있을거라고 생각하여 탭 별로 정렬 할 수 있도록 바꾸었습니다.
 - 그러나 단순 쿼리문에서 where category = '값' 만 통해서는 검색까지 동반 될 시 필터가 제대로 되지않는 것을 확인 mybatis 동적쿼리 if문을 통하여 새로 쿼리문을 작성해주었습니다.
 - [코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/resources/mapper/BoardMapper.xml#L27)
<details>
<summary> 로그아웃 시 index.html 로 리다이렉트 되는 문제 </summary>
<div markdown="1">
	
```
  .logoutSuccessHandler((request, response, authentication) -> {
	String refererUrl = request.getHeader("Referer");
	response.sendRedirect(refererUrl);
  })
```
- SecurityConfig에 configure 메서드에 logoutSucceHandelr 로 request.getHeader 을 redirect 시키는방법으로 해결
</div>
</details> 
<details>
<summary>aws ec2 서버 배포시 db 연결문제  </summary>
<div markdown="1">
	- springframework.boot 2.7.9 에서 2.7.7 로 다운했더니 해결
</div>
</details> 

<details>
<summary> 정렬&검색 구현후 정렬되지않은 상태에서 검색 시 오류 </summary>
<div markdown="1">
	
```
		<c:if test="${not empty pagination.search.category }">
			<input type="hidden" value="${pagination.search.category }" name="category">
		</c:if>
```
- 간단하게 category 값이 존재할때만 값을 보내주도록 설정해주었다.
</div>
</details> 

<details>
<summary> 게시글 작성 시 yyyy-mm-dd 형식으로만 출력되는 문제   </summary>
<div markdown="1">
	
```
	
						CASE 	WHEN 	(DATE_FORMAT(NOW(),'%Y-%m-%d') = DATE_FORMAT(b_datetime,'%Y-%m-%d'))
						THEN		(DATE_FORMAT(b_datetime,'%H:%i'))
						ELSE 		(DATE_FORMAT(b_datetime,'%Y-%m-%d'))
						END
						) as bDateTime
```
- case when 을 사용하여 해결해주었다.

</div>
</details> 

<details>
<summary>작성된 설문조사 출력시 survey 객체 하나에 다른 객체들의 data가 담겨있지않는 현상 </summary>
<div markdown="1">
```

	public Survey respondSurvey(Survey survey) {
		Survey resultSurvey = surveymapper.getSurvey(survey);
			
		resultSurvey.setQuestions(surveymapper.getQuestions(survey));
			for(Question question : resultSurvey.getQuestions()) {
				question.setsIdx(survey.getsIdx());
				question.setItems(surveymapper.getItems(question));			
			}
	
	   	return resultSurvey;
	}
-서비스 로직에서 mybatis 를 통해 데이터를 얻은 객체들을 forEach 문으로 객체에 data들을 담는것에 성
</div>
</details>

## 회고와 느낀점

Spring으로 Web 개발을 할때 어떤 형식의 구조로 개발이 진행되는지 느낄 수 있었습니다

그리고 스프링의 큰 특징중 하나인 의존성 주입 (빈을 통해 autowired 함으로써 코드의 중복을 줄이고 유지보수에 좀더 효울적인 방식)의 효용성을 알수있었고

작은 게시판 기능이지만 정말 작은 기능이라도 책이나 온라인강의에서 보던 사용예제를 실제로 내가 적용시키는것은 정말 많은 생각과 고민을 하게만드는것,
생각보다 코딩치는 시간보다 설계하고 어떻게 코드를 구성해야할까 고민하는 시간이 훨씬 생각보다 길다는 것,
책으로 봤던 기술들을 머리로는 이해했다고 생각했지만 단편적으로만 이해한것일 뿐, 막상 실무에 적용시키는것은 또 다른 문제라는것까지 많은 것을 느낄수있었습니다.

언젠가는 많은 경험을 통해 실무에 기술을 적용시키는 수준까지 레벨을 올리고싶단 생각이 들었습니다.


다른 많은 기능들 보다 내가 사용자의 입장에서 생각해서 만든 정렬&검색 기능을 구현할때 하루 이틀을 꼬박 고민하고 설계해서 마침내 구현했을때 정말 짜릿하였고 개발의 참 재미를 느낄 수 있었습니다.
처음에는 정말 간단한 자바 코드 조차 이해못해서 헤매이고, 게시판을 처음 만들어 볼때는 벽에 마주한 기분이었지만 결국 이렇게까지 만들어낸 지금은 계속 고민하고, 공부를 하다보면 해결 못 할 문제는 없다는 자신감이 생겼습니다!

