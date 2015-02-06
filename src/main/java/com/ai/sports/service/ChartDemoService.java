package com.ai.sports.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ai.sports.dao.ChartDemoDao;

@Service
public class ChartDemoService {
    
    @Autowired
    private ChartDemoDao chartDemoDao;
    
    public List<Map<Object, Object>> query1(String startMon, String endMon){
        return chartDemoDao.query1(startMon, endMon);
    }

}
