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
下面打印出数据结果集
<#if dataList?exists> 
   
   <#list dataList as row>  
       <div>${row_index} , 
       <#list row?keys as col>
               <span>${col} : ${row[col]}, </span>
       </#list>
       </div>
   </#list>
   
</#if> 
</div>

<div align="center"><input type="button" id="btn" onclick="queryAjax()" value="ajax刷新图形"></input></div>
<div id="chartdiv3" align="center">图形将出现这个DIV 里，到时这里的字将被图形替代。
</div>

<script>
//list 的值 [{s2=2000, s1=0, s7=-2000, s5=0, type=乒乓球, s6=2000, s3=16000, s4=0}, {s2=1116000, s1=260000, s7=-8149200, s5=3920100, type=篮球, s6=869050, s3=150366946, s4=1079000}, {s2=20000, s1=0, s7=-383000, s5=0, type=羽毛球, s6=376000, s3=506178, s4=0}]
//打开页面时，controller会返回dataList给前台ftl，下面js负责拼装xml字符串，用于展示
<#if dataList?exists> 
   var colors = ['1D8BD1', 'F1683C', '2AD62A', 'DBDC25']; //图形里各条折线的颜色，可以自己定义，xml里还可以设置其他很多属性，参考文档
   var xml = "<chart bgAlpha='10,10' bgAngle='270' bgColor='FFFFFF,CC3300' chartRightMargin='35' numvdivlines='5' labelStep='2' shadowAlpha='40' alternateHGridColor='CC3300' alternateHGridAlpha='5' showAlternateHGridColor='1' divLineIsDashed='1' divLineColor='CC3300' divLineAlpha='20' anchorRadius='2' formatNumberScale='0' showValues='0' lineThickness='1' subcaption='' caption='每日营业额'>";
   var xml_category = "<categories><category label='${month}25'/><category label='${month}26'/><category label='${month}27'/><category label='${month}28'/><category label='${month}29'/><category label='${month}30'/><category label='${month}31'/></categories>";
   var xml_dataset = "";
   //alert(${dataList?size});
   <#list dataList as row>  
       //alert("index: " + ${row_index});
           xml_dataset += "<dataset color='"+ colors[${row_index}] +"' seriesName='"+ "${row.item}" +"'>" ; 
           xml_dataset += "<set value='"+ ${row.d25} +"'/>" ;
           xml_dataset += "<set value='"+ ${row.d26} +"'/>" ;
           xml_dataset += "<set value='"+ ${row.d27} +"'/>" ;
           xml_dataset += "<set value='"+ ${row.d28} +"'/>" ;
           xml_dataset += "<set value='"+ ${row.d29} +"'/>" ;
           xml_dataset += "<set value='"+ ${row.d30} +"'/>" ;
           xml_dataset += "<set value='"+ ${row.d31} +"'/>" ;
           xml_dataset += "</dataset>" ;
       //<#list row?keys as col>
       //        //alert("col:" + "${row[col]}");
       //    <#if col != "item">
       //    </#if>
       //</#list>
   </#list>
   
   xml += xml_category;
   xml += xml_dataset;
   xml += "</chart>";
   //alert(xml);
   
   var myChart = new FusionCharts("${base}/swf/V12Charts/MSLine.swf", "myChartId", "900", "450");
   myChart.setDataXML(xml); //设置数据xml
   myChart.render("chartdiv");   //将图形渲染到  chartdiv
</#if> 

// ajax 获取json刷新图形展示
function queryAjax()
{
   $.ajax({  
       type:'GET',  
       contentType:'application/json',  
       url:'ajax/multiLine2D', 
       dataType:'json',  
       success:function(data) {  
         refreshChart(data);  //成功获取数据后渲染图形
       },  
       error:function(data) {  
         alert("获取json失败")  
       }  
     });  
}

function refreshChart(data)
{
   //data 是json格式数据，拼接逻辑和上面 一样
   if(data != null && data.xml.length > 0)
   {
      var month = data.month;
      
      var colors = ['1D8BD1', 'F1683C', '2AD62A', 'DBDC25'];
      var xml = "<chart bgAlpha='10,10' bgAngle='270' bgColor='FFFFFF,CC3300' chartRightMargin='35' numvdivlines='5' labelStep='2' shadowAlpha='40' alternateHGridColor='CC3300' alternateHGridAlpha='5' showAlternateHGridColor='1' divLineIsDashed='1' divLineColor='CC3300' divLineAlpha='20' anchorRadius='2' formatNumberScale='0' showValues='0' lineThickness='1' subcaption='' caption='每日营业额'>";
      var xml_category = "<categories><category label='"+month+"25'/><category label='"+month+"26'/><category label='"+month+"27'/><category label='"+month+"28'/><category label='"+month+"29'/><category label='"+month+"30'/><category label='"+month+"31'/></categories>";
      var xml_dataset = "";

      for(var i = 0; i < data.xml.length; i++)
      {  
              var row = data.xml[i];
              xml_dataset += "<dataset color='"+ colors[i] +"' seriesName='"+ row.item +"'>" ; 
              xml_dataset += "<set value='"+ row.d25 +"'/>" ;
              xml_dataset += "<set value='"+ row.d26 +"'/>" ;
              xml_dataset += "<set value='"+ row.d27 +"'/>" ;
              xml_dataset += "<set value='"+ row.d28 +"'/>" ;
              xml_dataset += "<set value='"+ row.d29 +"'/>" ;
              xml_dataset += "<set value='"+ row.d30 +"'/>" ;
              xml_dataset += "<set value='"+ row.d31 +"'/>" ;
              xml_dataset += "</dataset>" ;
      }
      
      xml += xml_category;
      xml += xml_dataset;
      xml += "</chart>";
      alert(xml);
      
      var myChart = new FusionCharts("${base}/swf/V12Charts/MSLine.swf", "myChartId", "900", "450");
      myChart.setDataXML(xml);
      myChart.render("chartdiv3"); //div3    
   }

}
</script>
</body>
</html>