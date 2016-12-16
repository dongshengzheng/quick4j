package com.eliteams.quick4j.web.dao;


import com.eliteams.quick4j.web.model.Type;

import java.util.List;

public interface TypeMapper {
    int deleteByPrimaryKey(Integer tid);

    int insert(Type record);

    int insertSelective(Type record);

    Type selectByPrimaryKey(Integer tid);

    int updateByPrimaryKeySelective(Type record);

    int updateByPrimaryKey(Type record);

    List<Type> listTypes();
}