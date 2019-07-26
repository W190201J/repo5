package com.wander.entity;

import java.io.Serializable;
import java.util.Date;
public class User implements Serializable{
    private static final long serialVersionUID = 1L;

    private Integer uid;
    private String email;
    private String password;
    private String username;
    private Integer status;
    private Date join_time;
    private Integer gender;
    private String phone;
    private String avatar;
    private String intro;
    private String industry;
    private String education;
    private Integer liked_count;
    private Integer follow_count;
    private Integer follower_count;
    private Integer scan_count;
    private Integer score;
    private Integer reserve1;
    private  Integer reserve2;

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getJoin_time() {
        return join_time;
    }

    public void setJoin_time(Date join_time) {
        this.join_time = join_time;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        this.industry = industry;
    }

    public String getEducation() {
        return education;
    }

    public void setEducation(String education) {
        this.education = education;
    }

    public Integer getLiked_count() {
        return liked_count;
    }

    public void setLiked_count(Integer liked_count) {
        this.liked_count = liked_count;
    }

    public Integer getFollow_count() {
        return follow_count;
    }

    public void setFollow_count(Integer follow_count) {
        this.follow_count = follow_count;
    }

    public Integer getFollower_count() {
        return follower_count;
    }

    public void setFollower_count(Integer follower_count) {
        this.follower_count = follower_count;
    }

    public Integer getScan_count() {
        return scan_count;
    }

    public void setScan_count(Integer scan_count) {
        this.scan_count = scan_count;
    }

    public Integer getScore() {
        return score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Integer getReserve1() {
        return reserve1;
    }

    public void setReserve1(Integer reserve1) {
        this.reserve1 = reserve1;
    }

    public Integer getReserve2() {
        return reserve2;
    }

    public void setReserve2(Integer reserve2) {
        this.reserve2 = reserve2;
    }
}
