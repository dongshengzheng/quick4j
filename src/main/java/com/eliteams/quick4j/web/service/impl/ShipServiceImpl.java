package com.eliteams.quick4j.web.service.impl;

import com.eliteams.quick4j.web.dao.ShipMapper;
import com.eliteams.quick4j.web.dao.TypeMapper;
import com.eliteams.quick4j.web.model.Parameter;
import com.eliteams.quick4j.web.model.Ship;
import com.eliteams.quick4j.web.model.Type;
import com.eliteams.quick4j.web.service.ShipService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;

/**
 * Created by Administrator on 2016/11/27 0027.
 */
@Service
public class ShipServiceImpl implements ShipService {

    @Autowired
    private ShipMapper shipMapper;

    @Autowired
    private TypeMapper typeMapper;

    @Override
    public List<Ship> listShips() {
        return shipMapper.listShips();
    }

    @Override
    public void insert(Ship ship) {
        shipMapper.insert(ship);
    }

    @Override
    public Ship selectByImo(String imo) {

        return shipMapper.selectByPrimaryImo(imo);
    }

    @Override
    public Ship selectById(Integer id) {
        return shipMapper.selectById(id);
    }

    @Override
    public void updateByPrimaryKey(Ship ship) {
        shipMapper.updateByPrimaryKey(ship);
    }

    @Override
    public List<Type> listTypes() {
        return typeMapper.listTypes();
    }

    @Override
    public List<Ship> listShips(Ship ship) {
        return shipMapper.select(ship);
    }

    @Override
    public void deleteById(int id) {
        shipMapper.deleteByPrimaryKey(id);
    }

    @Override
    public PageInfo<Ship> queryByPage(Parameter parameter, Integer pageNo, Integer pageSize) {
        if (pageNo==null||pageNo<=0){
            pageNo=1;
        }

        pageSize=pageSize==null?50:pageSize;
        PageHelper.startPage(pageNo,pageSize);
        List<Ship> ships=shipMapper.selectByName(parameter);

        //用pageInfo对结果进行包装
        PageInfo<Ship> page=new PageInfo(ships);

        return page;
    }

    /*
    * 上传文件到服务器上
    * */
    @Override
    public void uploadImage(MultipartFile shipImage) {
        String uploadFilePath="D:\\maven_workspace\\ship\\src\\main\\webapp\\images\\";
        String filename=shipImage.getOriginalFilename();
        try {
            InputStream is=shipImage.getInputStream();

            //如果服务器已经存在和上传文件同名的文件，则输出提示消息
            File file=new File(uploadFilePath+filename);
            if (file.exists()){
                boolean delResult = file.delete();
                System.out.println("删除已经存在的文件"+delResult);
            }

            if (!filename.equals("")){
                FileOutputStream fos=new FileOutputStream(uploadFilePath+filename);
                byte[] buffer=new byte[8192];
                int count=0;

                //开始读取上传文件的字节，并将其输出到服务端的上传文件输出流中
                while ((count=is.read(buffer))>0){
                    fos.write(buffer,0,count);
                }
                fos.close();
                is.close();
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }
}

