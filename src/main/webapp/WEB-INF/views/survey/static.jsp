<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
        //������Ʈ 
        google.charts.load('current', {'packages':['corechart']}); 
        google.charts.setOnLoadCallback(drawChart);
        
        function drawChart() {
            var data = new google.visualization.DataTable();
            data.addColumn('string','Answer');	//item_content column type, name
            data.addColumn('number','Count');		//item_content count type  	
 
            data.addRows([ 
                ['����',15],	//content, count
                ['ġŲ',25],	
                ['�ܹ���',63]	
            ]);
            var pie_opt = {
                    'title':'�����ϴ� ����',	//qTitle
                    'width':400,
                    'height':400,
                    pieSliceText:'label',
                    'is3D':true
                    	
            };
            var pie_chart = new google.visualization.PieChart(document.getElementById('piechart'));
            pie_chart.draw(data,pie_opt);
            
            var bar_opt = {
        			'title':'�����ϴ� ����',	//qTitle
                    'width':400,
                    'height':400
                     
                  
        	};
        
        	var bar_chart = new google.visualization.BarChart(document.getElementById('barchart'));
        	bar_chart.draw(data, bar_opt); 
            
            
        }
 
        </script>
    </head>
<body>
	 <div id="piechart"></div>
	 <div id="barchart"></div>
</body>
</html>