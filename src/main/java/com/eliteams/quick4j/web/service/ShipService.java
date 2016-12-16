package com.eliteams.quick4j.web.service;

import com.eliteams.quick4j.web.model.Parameter;
import com.eliteams.quick4j.web.model.Ship;
import com.eliteams.quick4j.web.model.Type;
import com.github.pagehelper.PageInfo;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Administrator on 2016/11/27 0027.
 */
public interface ShipService {
    List<Ship> listShips();

    void insert(Ship ship);

    Ship selectByImo(String imo);

    Ship selectById(Integer id);

    void updateByPrimaryKey(Ship ship);

    List<Type> listTypes();

    List<Ship> listShips(Ship ship);

    void deleteById(int id);

    PageInfo<Ship> queryByPage(Parameter parameter, Integer pageNo, Integer pageSize);

    void uploadImage(MultipartFile shipImage);
}
