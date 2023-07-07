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

### 4-1. Controller
컨트롤러에서는 화면단에서 넘어온 요청을 Servcie 계층에 로직처리는 위임합니다.
[코드확인](https://github.com/GukSense/lcomputerstudytwo-1/blob/main/src/main/webapp/WEB-INF/views/board/boardList.jsp#L36)

### 4-2 Service


### 4-3 Mapper


</div>
</details>
