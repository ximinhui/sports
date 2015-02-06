package com.ai.sports.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface ChartDemoDao {
    
    public List<Map<Object, Object>> query1(@Param("startMon") String startMon, @Param("endMon")  String endMon);

}
