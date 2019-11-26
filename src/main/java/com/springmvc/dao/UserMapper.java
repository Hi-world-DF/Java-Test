package com.springmvc.dao;

import com.springmvc.entity.User;

import java.util.List;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    public User checkUser(String name);

    //获取用户列表
    public List<User> getUserList();

    //保存用户数据
    public void saveUserInfo(User user);

    //修改对象数据
    public void updateUserInfo(User user);

    //（批量）删除用户数据
    public void deleteUserInfoByIds(Integer[] id);
}