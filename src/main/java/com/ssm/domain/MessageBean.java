package com.ssm.domain;

import java.util.HashMap;
import java.util.Map;

public class MessageBean {
    //状态码 100-成功，200-失败
    private int code;
    //提示信息
    private String msg;
    //用户要返回给浏览器的数据
    private Map<String, Object> extend = new HashMap<>();

    public static MessageBean success() {
        MessageBean msg = new MessageBean();
        msg.setCode(100);
        msg.setMsg("处理成功");
        return msg;
    }

    public static MessageBean fail() {
        MessageBean msg = new MessageBean();
        msg.setCode(200);
        msg.setMsg("处理失败");
        return msg;
    }

    /**
     * 处理请求参数
     * @param key
     * @param value
     * @return
     */
    public MessageBean add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
