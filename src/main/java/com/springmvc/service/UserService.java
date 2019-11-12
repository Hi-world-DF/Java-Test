package com.springmvc.service;

import com.springmvc.entity.User;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    //校验密码
    public User checkUser(String name, String password);
}
