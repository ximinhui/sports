<#setting url_escaping_charset='utf-8'>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title></title>
<script type="text/javascript" src="${base}/js/jquery-1.6.min.js"></script>
<script type="text/javascript" src="${base}/js/FusionCharts.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />

</head> 
<body>

<br/>
<div id="chartdiv" align="center">图形将出现这个DIV 里，到时这里的字将被图形替代。
</div>

<div id="chartdiv2" align="center">

</div>



<script language="javascript">

 
 var xmlStr = 
"<chart useRoundEdges='1' formatNumberScale='0' decimals='0' showValues='0' yAxisName='Units' xAxisName='Month' caption='Unit Sales' palette='2'>"+
"    <set value='462' label='Jan'/>                                                                                                              "+
"    <set value='857' label='Feb'/>                                                                                                              "+
"    <set value='671' label='Mar'/>                                                                                                              "+
"    <set value='494' label='Apr'/>                                                                                                              "+
"    <set value='761' label='May'/>                                                                                                              "+
"    <set value='960' label='Jun'/>                                                                                                              "+
"</chart>                                                                                                                                        "       
;
 var myChart = new FusionCharts("${base}/swf/V12Charts/Column2D.swf", "myChartId", "600", "450");
 myChart.setDataXML(xmlStr);
 myChart.render("chartdiv");  
 
 
</script>
</body>
</html>