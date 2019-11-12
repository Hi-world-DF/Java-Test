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
@Controller
@RequestMapping("user")
public class userController {

    @RequestMapping("/gotoUserManage")
    public ModelAndView gotoUserManage(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userManage/userList");
        return modelAndView;
    }

}
