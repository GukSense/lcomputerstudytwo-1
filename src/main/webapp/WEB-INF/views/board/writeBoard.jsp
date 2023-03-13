<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.content_box {
		 width: 800px;
   	 	height: 500px;   	 	
    	resize: none;
	}
	
	.head_bar {
		float:left;
	}
	.select_c {
		width:160px;
		height:30px;
	}
	.title_bar {
		width:634px;
		height:25px;	
	}
	.btn {
		background-color: #1b5ac2; 
		color:#ffffff;
		float:right;
	}
	.fileBtn{
		float:left;
	}
	
</style>
</head>
<body>
	
	<form method="post" action="/board/writeBoard" onsubmit="return confirm('등록하시겠습니까?');" name="registration" enctype="multipart/form-data">
    			<input type="hidden" value="${principal.uName }" name ="username">
    			<table style= "text-align: center; boarder: 1px solid #dddddd; margin-left:auto; margin-right:auto;">
	    	    	<thead>
		    	    	<tr>
		    	    		<th colspan= "2" style= "background-color: #1b5ac2; color:#ffffff; text-align: center;">게시판 글쓰기 양식</th>
		    	    	</tr>
	    	    	</thead>
			    	<tbody>
			    		<tr class="head_bar">
			    			<td>
			    				<select class="select_c" name="bCategory">
			    					<option value="lcomputer">lcomputer</option>
			    					<option value="개발">개발</option>
			    					<option value="일상">일상</option>
			    					<option value="질문">질문</option>
			    				</select>
			    			</td>
			    			<td><input type="text" class="title_bar" placeholder="글 제목"  name="bTitle" maxlength="50" ></td>
			    		</tr>
			    		<tr>
			    			<td>
			    				<textarea  placeholder="글 내용"  name="bContent" class="content_box" maxlength="2048" ></textarea>
			    			</td>
			    		</tr>
			    	</tbody>
			    	<tr>
			    		<td><input type="file" name="fileName" class= "fileBtn"></td>
			    		<td><input type="submit" class="btn" value="글쓰기" ></td></tr>
    	    	</table>
    </form>
</body>
</html>