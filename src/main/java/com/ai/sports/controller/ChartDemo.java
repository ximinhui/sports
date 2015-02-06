package com.ai.sports.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ai.sports.service.ChartDemoService;

@Controller
@RequestMapping("/chartDemo")
public class ChartDemo {
    
    @Autowired
    private ChartDemoService chartDemoService;
    
    @RequestMapping("/pie")
    public ModelAndView pie(){
        ModelAndView mav = new ModelAndView("chart1.ftl");
        return mav;
    }
    
    @RequestMapping("/column2D")
    public ModelAndView column2D(){
        ModelAndView mav = new ModelAndView("column2D.ftl");
        
        //String xml = "<chart useRoundEdges='1' formatNumberScale='0' decimals='0' showValues='0' yAxisName='Units' xAxisName='Month' caption='Unit Sales' palette='2'><set value='462' label='Jan'/><set value='857' label='Feb'/><set value='671' label='Mar'/><set value='494' label='Apr'/><set value='761' label='May'/><set value='960' label='Jun'/></chart>";
        //List<Map<String, String>> list = chartDemoService.query1("201412", "201501");
        //mav.addObject("DATAXML", xml);
        return mav;
    }
    
    /**
     * 功能描述: 查询出list结果返回给前台用于图形展示<br>
     * 〈功能详细描述〉
     *
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("/multiLine2D")
    public ModelAndView multiLine2D(){
        ModelAndView mav = new ModelAndView("multiLine2D.ftl");
        
        List<Map<Object, Object>> list = chartDemoService.query1("201412", "201501"); //sql见ChartDemoDao.xml
        mav.addObject("month", "201412"); //用于图形展示里横坐标的月份拼接
        mav.addObject("dataList", list);
        return mav;
    }
    
    /**
     * 功能描述: 处理ajax请求，获取数据，返回json<br>
     * 〈功能详细描述〉
     *
     * @return
     * @see [相关类/方法](可选)
     * @since [产品/模块版本](可选)
     */
    @RequestMapping("/ajax/multiLine2D")
    @ResponseBody
    public Map ajaxMultiLine2D(){
        List<Map<Object, Object>> list = chartDemoService.query1("201412", "201501");
        
        Map map = new HashMap();
        map.put("month", "201412"); //用于图形展示里横坐标的月份拼接
        map.put("xml", list);
        return map;
    }
    
    

}