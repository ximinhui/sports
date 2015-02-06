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

<script language="javascript">
 //alert("a");
 alert($('#chartdiv').html());
 
 var xmlStr = 
"<chart manageResize='1' caption='Sales distribution by Employee' subCaption='Jan 07 - Jul 07' numberPrefix='$' is2D='1' isSliced='1' showPlotBorder='1' plotBorderThickness='1' plotBorderColor='000000' streamlinedData='0'>"+
"   <set label='Buchanan' value='50000' />                                                                                                                                                                                    "+
"   <set label='Callahan' value='49000' />                                                                                                                                                                                    "+
"   <set label='Davolio' value='63000' />                                                                                                                                                                                     "+
"   <set label='Dodsworth' value='41000' />                                                                                                                                                                                   "+
"   <set label='Fuller' value='74000' />                                                                                                                                                                                      "+
"   <set label='King' value='49000' />                                                                                                                                                                                        "+
"   <set label='Leverling' value='77000' />                                                                                                                                                                                   "+
"   <styles>                                                                                                                                                                                                                  "+
"      <definition>                                                                                                                                                                                                           "+
"         <style type='font' name='captionFont' size='15' />                                                                                                                                                                  "+
"      </definition>                                                                                                                                                                                                          "+
"      <application>                                                                                                                                                                                                          "+
"         <apply toObject='CAPTION' styles='captionFont' />                                                                                                                                                                   "+
"      </application>                                                                                                                                                                                                         "+
"   </styles>                                                                                                                                                                                                                 "+
"</chart>                                                                                                                                                                                                                     ";
 var myChart = new FusionCharts("${base}/swf/V12Charts/Funnel.swf", "myChartId", "600", "450");
 myChart.setDataXML(xmlStr);
 myChart.render("chartdiv");  
</script>
</body>
</html>