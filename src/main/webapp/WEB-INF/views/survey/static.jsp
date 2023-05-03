<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
        //구글차트 
        google.charts.load('current', {'packages':['corechart']}); 
        google.charts.setOnLoadCallback(drawChart);
        
        function drawChart() {
        	$.ajax({
        		type : "GET",
        		url: "/get/chart/data",
        		data : {
        			sIdx : ${survey.sIdx}
        		},
        		success: function (data) {
        			let index = 0;
        			console.log('getDATA START: ');
        			console.dir(data);
        			console.log('getDATA END:');
        			
        			for(var key in data) {
			            var data2 = new google.visualization.DataTable();
			            data2.addColumn('string','Answer');	//item_content column type, name
			            data2.addColumn('number','Count');		//item_content count type  	

			            data[key].forEach(function(element, index, array) {
				            data2.addRows([ 
				                [element.content, element.count]	//content, count
				            ]);			            	
			            })
			            var pie_opt = {
			                    'title':'Q ' + data[key][0].qTitle,	//qTitle
			                    'width':400,
			                    'height':400,
			                    pieSliceText:'label',
			                    'is3D':true
			                    	
			            };
			            var pie_chart = new google.visualization.PieChart(document.getElementById('piechart' + index));
			            pie_chart.draw(data2,pie_opt);
			            index++;
        			}
        		}
        	});
        }        	                        
        </script>
    </head>
<body>
	 <h1>${survey.sTitle} </h1>
	 <hr>
	 <c:forEach items="${resultList}" var="result" varStatus="status">	 	
	 	<div id="piechart${status.index}"></div>
	 </c:forEach>
	 <h3>주관식</h3>
	 <c:forEach items="${resultList2}" var="result">
	 	<div>
	 		<c:if test="${result.qType == 'long'}">
	 			<ul>
	 				<li>${result.content }</li>
	 			</ul>
	 		</c:if>
	 	</div>
	</c:forEach> 
</body>
</html>