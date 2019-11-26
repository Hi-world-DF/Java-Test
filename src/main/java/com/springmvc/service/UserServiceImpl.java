package com.springmvc.service;

import com.springmvc.dao.UserMapper;
import com.springmvc.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User checkUser(String name, String password) {
        return userMapper.checkUser(name);
    }

    @Override
    public List<User> getUserList() {
        return userMapper.getUserList();
    }
    @Override
    public void saveUserInfo(User user){
        if(user.getId() != null){
            //修改
            userMapper.updateUserInfo(user);
        }else {
            //添加
            userMapper.saveUserInfo(user);
        }

    }
    @Override
    public User selectUserById(Integer id){
        User user = userMapper.selectByPrimaryKey(id);
        return user;
    }

    @Override
    public void deleteUserInfoByIds(Integer[] id) {
        userMapper.deleteUserInfoByIds(id);
    }
}
