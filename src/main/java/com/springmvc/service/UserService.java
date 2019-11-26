package com.springmvc.service;

import com.springmvc.entity.User;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface UserService {
    //校验密码
    public User checkUser(String name, String password);
    //得到用户列表
    public List<User> getUserList();

    public void saveUserInfo(User user);

    public User selectUserById(Integer id);

    public void deleteUserInfoByIds(Integer[] id);
}
