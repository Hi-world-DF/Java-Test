package com.springmvc.service;

import com.springmvc.dao.UserMapper;
import com.springmvc.entity.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Resource
    private UserMapper userMapper;
    @Override
    public User checkUser(String name, String password) {
        return userMapper.checkUser(name);
    }
}
