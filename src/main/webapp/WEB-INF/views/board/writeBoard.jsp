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
		width:202%;
		height:500px; 	
    	resize: none;
	}
	
	.head_bar {
		width:100%;
		float:left;
	}
	.select_c {
		width:160px;
		height:30px;
	}
	.title_bar {
		width:300%;
		height:25px;	
	}
	.btn {
		width: 50px;
    	height: 40px;
   		border: 0px;
   	 	outline: none;
    	float: right;
    	background-color: rgba(255,255,255,0.3);
	}
	.fileBtn{
		float:left;
	}	
</style>
<link rel ="stylesheet" type="text/css" href="/css/table.css">
</head>
<body>
	<section>
		<form method="post" action="/board/writeBoard" onsubmit="return confirm('등록하시겠습니까?');" name="registration" enctype="multipart/form-data">
  			<input type="hidden" value="${principal.uName }" name ="username">
 	    	<div class="tbl-header">
    			<table style= "text-align: center; boarder: 1px solid #dddddd; margin-left:auto; margin-right:auto;">
		    	    	<thead>
			    	    	<tr>
			    	    		<th colspan= "2" style="color:#ffffff; text-align: center; " ><h2>게시판 글쓰기 양식</h2></h2></th>
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
			    	</tbody>
	    	    </table>
 	    	</div>
 	    	<div class="tbi-content">
	 	    	<table cellpadding="0" cellspacing="0" border="0">
	 	    		<tbody>
						<tr>	 					
						    <td><textarea  placeholder="글 내용"  name="bContent" class="content_box" maxlength="2048" ></textarea></td>					    
						</tr>
						<tr>
							<td><input type="file" name="file" class= "fileBtn"></td>
						    <td><input type="submit" class="btn" value="글쓰기" ></td>
					    </tr>
	 	    		</tbody>
	 	    	</table>
 	    	</div>
	    </form>
	</section>
</body>
</html>