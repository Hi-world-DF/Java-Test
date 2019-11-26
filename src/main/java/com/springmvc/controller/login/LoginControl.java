package com.springmvc.controller.login;

import com.springmvc.entity.User;
import com.springmvc.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/*
* 登陆的Controller
* Created by wangdf
* time:2019/11/11
* */
@Controller
@RequestMapping("/login")
public class LoginControl {

    @Autowired
    private UserService userService;
    private boolean date;
    @RequestMapping("/gotoLoginPage")
    public String gotoLoginPage(HttpServletRequest request){
        return "login/login";
    }

    @RequestMapping("/loginCheck")
    public ModelAndView loginCheck(@Param("username")String username,@Param("password")String password,Model model) {
        User user=userService.checkUser(username, password);
        ModelAndView modelAndView = new ModelAndView();
        if(user.getUsername().equals(username) && user.getPassword().equals(password)){
            modelAndView.setViewName("listManage/mainList");
        }else{
            modelAndView.setViewName("login/login");
        }
        return modelAndView;
    }

    @RequestMapping("/gotoMainPage")
    public ModelAndView gotoUserManage(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("login/index");
        return modelAndView;
    }

}

