package com.eliteams.quick4j.web.controller;

import com.eliteams.quick4j.web.model.Parameter;
import com.eliteams.quick4j.web.model.Ship;
import com.eliteams.quick4j.web.model.Type;
import com.eliteams.quick4j.web.service.ShipService;
import com.github.pagehelper.PageInfo;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2016/11/27 0027.
 */

@Controller
public class ShipController {
    @Autowired
    private ShipService shipService;

    //显示船舶信息
    @RequestMapping(value = "/ships",method = RequestMethod.GET)
    private String excute(ModelMap modelMap, HttpSession session){
        Parameter parameter= (Parameter) session.getAttribute("parameter");
        if(parameter==null){
            //将参数放到Param中
            parameter=new Parameter();
            parameter.setTid(1);
            //将参数放进session中
            session.setAttribute("parameter",parameter);
        }


        //从session中取出当前页
        Integer pageNum= (Integer) session.getAttribute("pageNum");

        PageInfo<Ship> page=shipService.queryByPage(parameter,pageNum,null);
        modelMap.put("page",page);

        List<Type> types=shipService.listTypes();
        session.setAttribute("types",types);

        return "shipList";
    }

    //点击搜索查询
    @RequestMapping(value = "/ships/condition",method = RequestMethod.GET)
    private String search(Parameter parameter,ModelMap modelMap,HttpSession session){
        //点击搜索，将session中的pageNum移除
        session.removeAttribute("pageNum");

        PageInfo<Ship> page=null;
        //如果搜索查询，都没有，怎么默认查询第一种类型的船
        if (parameter.getImo().length()<=0&&parameter.getName().length()<=0){
            parameter.setTid(1);
            page=shipService.queryByPage(parameter,null,null);
        }else {
            parameter.setTid(0);
            page=shipService.queryByPage(parameter,null,null);
            List<Ship> ships=page.getList();
            for (Ship s:ships){
                parameter.setTid(s.getType().getTid());
            }
        }
        //将参数放进session中
        session.setAttribute("parameter",parameter);
        modelMap.put("page",page);


        return "shipList";
    }
    //选择类型查询
    @RequestMapping(value = "/ships/type",method = RequestMethod.GET)
    private String searchType(@RequestParam int tid,ModelMap modelMap,HttpSession session){
        Parameter parameter=new Parameter();
        parameter.setTid(tid);
        PageInfo<Ship> page=shipService.queryByPage(parameter,null,null);
        modelMap.put("page",page);

        session.setAttribute("parameter",parameter);
        return "shipList";
    }


    //上页，下页查询
    @RequestMapping(value = "/ships/page",method = RequestMethod.GET)
    private String searchPage(Parameter parameter, @RequestParam int pageNum, ModelMap modelMap){

        PageInfo<Ship> page=shipService.queryByPage(parameter,pageNum,null);
        modelMap.put("page",page);
        return "shipList";
    }


    //添加船的信息
    @RequestMapping(value="/ships/addBefore")
    private String shipsAddBefore(ModelMap modelMap){
        return "shipAdd";
    }

    @RequestMapping(value="/ships/add",method = RequestMethod.POST)
    private String shipsAdd(Ship ship, Type type,HttpSession session){
        ship.setType(type);
        String filename=ship.getShipImage().getOriginalFilename();
        if(!filename.equals("")) {
            ship.setFilename(filename);
            InputStream is = null;

            //将文件以字节读到byte数组中,并且以字节形式插入到存到数据库中去
            try {
                is = ship.getShipImage().getInputStream();
                byte[] filedata = new byte[(int) ship.getShipImage().getSize()];
                is.read(filedata);
                ship.setFiledata(filedata);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        //获取录入数据的时间
        Date date=new Date();
        ship.setInputdate(date);

        //将文件上传到服务器上去。
        //shipService.uploadImage(ship.getShipImage());

        try {
           shipService.insert(ship);
            session.setAttribute("mes",true);
        } catch (Exception e) {
            session.setAttribute("mes",false);
            e.printStackTrace();
        }

        return "redirect:/rest/ships/addBefore";
    }
    // 清除session中的mes
    @RequestMapping(value="/ships/remove",method = RequestMethod.POST)
    @ResponseBody
    private JSONObject remove(HttpSession session){
        JSONObject jsonObject=new JSONObject();
        session.removeAttribute("mes");
        return jsonObject;
    }




    //更新船舶信息数据
    @RequestMapping(value = "/ships/search",method = RequestMethod.GET)
    private String search(@RequestParam Integer id,@RequestParam int pageNum, Model model,HttpSession session){
        Ship ship=shipService.selectById(id);
        model.addAttribute("ship",ship);

        //点击更新，将当前页放入session中
        session.setAttribute("pageNum",pageNum);
        return "shipUpdate";
    }

    @RequestMapping(value = "/ships/update",method = RequestMethod.POST)
    private String update(Ship ship, Type type,ModelMap modelMap){
        ship.setType(type);
        String filename=ship.getShipImage().getOriginalFilename();
        if (!filename.equals("")){
            ship.setFilename(filename);
            InputStream is=null;

            //将文件以字节读到byte数组中,并且以字节形式插入到存到数据库中去
            try {
                is=ship.getShipImage().getInputStream();
                byte[] filedata=new byte[(int) ship.getShipImage().getSize()];
                is.read(filedata);
                ship.setFiledata(filedata);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }else {
            Ship ship1=shipService.selectById(ship.getId());
            ship.setFiledata(ship1.getFiledata());
            ship.setFilename(ship1.getFilename());
        }
        Date date=new Date();
        ship.setInputdate(date);
        shipService.updateByPrimaryKey(ship);

        return "redirect:/rest/ships";
    }

    //显示图片
    @RequestMapping(value = "/ships/image")
    private void viewImage(@RequestParam int id, HttpServletResponse response){
        Ship ship=shipService.selectById(id);
        byte[] filedata=ship.getFiledata();
        response.setContentType("image/jpeg");
        response.setCharacterEncoding("UTF-8");
        try {
            OutputStream outputStream=response.getOutputStream();
            InputStream in=new ByteArrayInputStream(filedata);
            int len=0;
            byte[] buf=new byte[1024];
            while ((len = in.read(buf,0,1024))!=-1){
                outputStream.write(buf,0,1024);
            }
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    //验证船号
    @RequestMapping(value = "/ships/confirm",method = RequestMethod.POST)
    @ResponseBody
    private JSONObject confirm(@RequestParam String imo){
        JSONObject jsonObject=new JSONObject();

        Ship ship=shipService.selectByImo(imo);
        if (imo!=""&&ship!=null){
            jsonObject.put("mes","该船号已经存在");
        }
        return jsonObject;
    }

    //删除船舶信息
    @RequestMapping(value = "/ships/deleteShips",method = RequestMethod.GET)
    private String deleteShips(@RequestParam String id,@RequestParam int pageNum, ModelMap modelMap,HttpSession session){
        String[] ids=id.split(":");
        for (String d:ids){
            shipService.deleteById( Integer.parseInt(d));
        }

        //从session中将参数信息获取出来
        Parameter parameter= (Parameter) session.getAttribute("parameter");

        PageInfo<Ship> page=shipService.queryByPage(parameter,pageNum,null);
        modelMap.put("page",page);

        return "shipList";
    }

    //跳转页面
    @RequestMapping(value="/ships/gotoPage",method = RequestMethod.GET)
    private String gotoPage(@RequestParam int pageNum,HttpSession session){
        session.setAttribute("pageNum",pageNum);
        return "redirect:/rest/ships";
    }



}
