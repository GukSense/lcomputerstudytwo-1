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

## 문제와해결
- 사용자가 게시판을 이용할때 본인이 원하는 정보만 필터해서 보길 원할 경우가 분명 있을거라고 생각하여 탭 별로 정렬 할 수 있도록 바꾸었습니다.
 - 그러나 단순 쿼리문에서 where category = '값' 만 통해서는 검색까지 동반 될 시 필터가 제대로 되지않는 것을 확인 mybatis 동적쿼리 if문을 통하여 새로 쿼리문을 작성해주었습니다.
 - [코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/resources/mapper/BoardMapper.xml#L27)
<details>
<summary> 로그아웃 시 index.html 로 리다이렉트 되는 문제 </summary>
<div markdown="1">
  - SecurityConfig에 configure 메서드에 logoutSucceHandelr 로 request.getHeader 을 redirect 시키는방법으로 해 
   ```
  .logoutSuccessHandler((request, response, authentication) -> {
	             String refererUrl = request.getHeader("Referer");
	             response.sendRedirect(refererUrl);
	         })
    ```
</div>
</details> 
<details>
<summary> </summary>
<div markdown="1">
<details>
<summary> </summary>
<div markdown="1">
  
