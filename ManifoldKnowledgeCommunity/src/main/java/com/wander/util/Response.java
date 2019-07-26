package com.wander.util;

public class Response {
    private int state;
    private String message;
    private Object data;

    /**
     * 构造方法
     *
     */
    public Response(){

    }

    public Response(int state){
        this.state=state;
    }
    public Response(int state,String message){
        this.state=state;
        this.message=message;
    }

    public Response(int state, String message, Object data){
        this.message=message;
        this.state=state;
        this.data=data;
    }

    /**
     * get，set方法
     * @return
     */
    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }
}
