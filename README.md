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

	
</div>
</details>

## 5.서비스 실행 모습 
<details>
<summary><b>주요기능 서비스 실행 모습 보기기</b></summary>

### 회원가입 및 로그인 서비스 기능 
<details>
<summary> 로그인 </summary>
<div markdown="1">

### 로그인화면과 비 로그인 상태일때 화면 표시
로그인 화면
 ![로그인화면](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/fb79c701-78d7-458e-9c1c-87803be5b57c)	

 ![비로그인시상태](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/ea8a8f56-147b-4bb8-9746-58014a9aecd6)	비 로그인 일 시 우측화면 상단에 상태표시가 뜬다.

 ![로그인후 우측상단 메뉴](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/32687b6d-39c4-43c8-b032-bd9a0a60dbc0)		로그인을 하면 상태가 바뀐다.


</div>
</details> 

<details>
<summary> 회원가입 </summary>
<div markdown="1">

### 회원가입 과 DB
![회원가입화면](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/fc053dc3-6208-43d9-a906-7b3fbca05273)
![회원가입후 DB](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/f0f0a58f-a52f-4a75-a2ea-7c4e34dc2edd)


</div> 
</details> 

### 게시판 기능들

<details>
<summary> 리스트 </summary>
<div markdown="1">

### 게시판 리스트의 모습 - 제목, 작성자 조회수 작성 카테고리등을 볼 수 있다.
![게시판리스트](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/cfba5d08-19df-404c-a967-504e8358c590)

</div> 
</details> 

<details>
<summary> 답글 </summary>
<div markdown="1">

### 답글은 답글 지정글 바로밑에 최신순으로 작성되게 구현 하였으며, 답글일 경우 화살표 이미지가 생성되게 하였다. 답글의 답글 일때 마다 n개 씩 늘어나도록 구현

 ![답글저장](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/2ce88ef0-8d30-41e7-b9f6-b88383a1a860)
</div> 

</details> 

<details>
<summary> 검색 </summary>
<div markdown="1">

### 검색은 제목, 내용, 작성자 별로 검색 할 수 있도록 구현 하였고, 정렬이 된 상태일 시 정렬이 유지된 채로 검색이 가능하도록 구현하였다.
### 검색 시 페이지네이션도 그에 맞춰서 변 할 수있게 구현해주었다.

(정렬하지않고)'테스트' 검색 시 화면
</br>
![일반검색](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/2aa014b0-acda-4e9f-b3c2-fedbe1879818)
<br>
(정렬 상태) '테스트' 검색 시 화면
</br>
![탭정렬 후 검색](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/9e5871f2-e109-4aaa-8969-ea3fc64721ff)
<br>
(정렬하지않고) 페이지네이션
</br>
![검색만했을시 페이지네이션](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/d6e27bae-c419-4d18-a18e-97b69acca270)
<br>
(정렬 상태) 페이지네이션
</br>
![탭정렬 후 검색 후 페이지네이션](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/7fc3fff4-a8d8-4dbf-9e8f-84eac934c67b)
<br>
</div> 
</details>


<details>
<summary> 쓰기와읽기 </summary>
<div markdown="1">

### 게시글 작성기능과 읽을 수 있는 기능을 구현 하였습니다.
글쓰기버튼 클릭 시 화면
<br>
![게시글 작성](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/5c3712f2-7782-450f-8fa7-2480fe214c7c)
<br>
게시글 작성 후 갱신 리스트 모습
<br>
![작성후 게시판](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/86080cba-8e94-4def-9e96-502d6aa5515c)
<br>
게시글 클릭 후 읽기 기능 구현 시 모습
<br>
![게시판 읽기](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/701fa286-88e2-4bc6-9a80-1f0f443d6a26)
<br>
</div> 

</details> 

<details>
<summary> 댓글 </summary>
<div markdown="1">

### 댓글은 게시글과 마찬가지로 답글, 삭제, 수정 기능이 있으며 ajax 를 통한 비동기방식으로 데이터가 처리 되도록 구현하였습니다.
댓글예시
<br>
![답글 후 댓글](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/b5afe6f3-515f-451e-a3bf-3f63f01d5947)
<br>
수정 버튼 클릭 시 화면
<br>
![수정시화면](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/60caa388-eb18-4486-879a-f79f7919ee44)
<br>
수정 후 댓글
<br>
![수정 후 댓글](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/a77ca4c9-e212-4880-b72c-e859d98c5e26)

</div> 
</details> 

<details>
<summary> 권한 </summary>
<div markdown="1">

### 권한 설정은 작성자는 삭제만 가능하게, 작성자는 삭제, 수정만 가능하도록 구현하였습니다

작성자일시 수정 삭제 답글만 가능하다.
<br>
![권한처리](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/4078217f-cb5a-4ff2-921f-e5a08755e201)
<br>
관리자는 삭제, 답글만 가능하다.
<br>
![권한처리](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/ddd02838-a36f-45fe-94de-0560246379a1)
<br>
</div> 
</details> 

### 설문조사

<details>
<summary> 작성과등록 </summary>
<div markdown="1">

### 설문조사를 작성하고 게시글에 올려 사람들이 투표 할 수 있게 구현하엿습니다.
설문조사 작성 화면
<br>
![설문조사 작성기능](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/4c898ba1-a39c-4704-81ad-834b21901cb0)
<br>
작성 된 설문조사의 모습
<br>
![설문조사 추가 후 리스트](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/e12ecca2-20b7-4c46-8ff2-cacf718c293d)

</div> 
</details> 

<details>
<summary> 응답과 통계 </summary>
<div markdown="1">

### 작성된 설문조사에 투표를 하고 통계를 볼 수 있습니다.

<br>
응답화면
<br>

![ㄹㄹㄹ](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/71722f95-4322-4cb5-8adb-3e649b098f7f)
<br>
통계화면
<br>
![통계3](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/e7452fe9-5e71-47cb-9ba0-2a5565b24676)

</div> 
</details> 

</div>
</details>

## 배포
 <details>
<summary> aws ec2를 통해 배포하는 경험을 해보았습니다. </summary>
<div markdown="1">
	
putty 를 통해  서버에 접속하는 모습
<br>
 ![putty](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/113506f6-19ab-43d0-8e88-66dcbd41050c)
 <br>
 sudo java -jar 파일이름.war 명령어를 통해 프로젝트 파일 실행하여 접속
 <br>
 ![리눅스화면](https://github.com/GukSense/lcomputerstudytwo-1/assets/101082667/b23a89fb-de30-45bb-bd0c-031df43f1438)
 <br>
 
 


</div>
</details> 
## ::pushpin: 문제와해결
### 가장기억에 남던 문제
- 사용자가 게시판을 이용할때 본인이 원하는 정보만 필터해서 보길 원할 경우가 분명 있을거라고 생각하여 탭 별로 정렬 할 수 있도록 바꾸었습니다.
 - 그러나 단순 쿼리문에서 where category = '값' 만 통해서는 검색까지 동반 될 시 필터가 제대로 되지않는 것을 확인 mybatis 동적쿼리 if문을 통하여 새로 쿼리문을 작성해주었습니다.
 - [코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/resources/mapper/BoardMapper.xml#L27)
### 그밖의 문제들
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

