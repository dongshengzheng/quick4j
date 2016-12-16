package com.eliteams.quick4j.web.dao;

import com.eliteams.quick4j.web.model.Parameter;
import com.eliteams.quick4j.web.model.Ship;

import java.util.List;

public interface ShipMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Ship record);


    Ship selectByPrimaryKey(Integer id);


    int updateByPrimaryKey(Ship record);

    List<Ship> listShips();

    Ship selectByPrimaryImo(String imo);

    Ship selectById(Integer id);

    //多条件查询
    List<Ship> select(Ship ship);


    //多条件分页查询
    List<Ship> selectByName(Parameter parameter);


}