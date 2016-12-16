package com.eliteams.quick4j.web.model;

/**
 * Created by zhen_Tomcat on 2016/12/06.
 */
public class Parameter {
    //船号
    private String imo;

    //船名
    private String name;

    //船的类型ID
    private int tid;

    public String getImo() {
        return imo;
    }

    public void setImo(String imo) {
        this.imo = imo;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }
}
