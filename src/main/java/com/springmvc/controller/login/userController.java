package com.springmvc.controller.login;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springmvc.entity.User;
import com.springmvc.service.UserService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class userController {

    //注入service对象
    @Resource
    private UserService userService;

    private Map<String,Object> result = new HashMap<String,Object>();

    @RequestMapping("/gotoUserManage")
    public ModelAndView gotoUserManage(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userManage/userList");
        return modelAndView;
    }

    //查询用户列表
    @RequestMapping("/getUserList")
    @ResponseBody //用于转换对象为Json
    public List<User> getUserList(){
        List<User> getUserList= userService.getUserList();
        return getUserList;
    }

    //跳转用户添加页面
    @RequestMapping("/addUserInfo")
    public ModelAndView addUserInfo(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("userManage/addUserInfo");
        return modelAndView;
    }

    @RequestMapping("/getUserListPage")
    @ResponseBody
    public Map<String,Object> userListPage(Integer page,Integer rows){
        //设置分页参数
        PageHelper.startPage(page,rows);
        //查询得到用户列表
        List<User> getUserList= userService.getUserList();
        //使用pageInfo 封装查询结果
        PageInfo<User> pageInfo = new PageInfo<User>(getUserList);
        //从pageInfo取出查询结果
        long total = pageInfo.getTotal();
        List<User> userList =pageInfo.getList();
        result.put("total",total);
        result.put("rows",userList);
        return result;
    }

    /**
     * 保存用户信息
     */
    @RequestMapping("/saveUserInfo")
    @ResponseBody
    public Map<String,Object> saveUserInfo(User user){
        try{
            userService.saveUserInfo(user);
            result.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("msg",e.getMessage());
        }
        return result;
    }
    /**
     * 根据id查询用户信息
     */
    @RequestMapping("/selectUserById")
    @ResponseBody
    public User selectUserById(Integer id) {
      User user =  userService.selectUserById(id);
      return user;
    }
    /**
     * （批量）删除用户信息
     */
    @RequestMapping("/deleteUserInfo")
    @ResponseBody
    public Map<String,Object> deleteUserInfo(Integer[] id) {
        try{
            userService.deleteUserInfoByIds(id);
            result.put("success",true);
        }catch (Exception e){
            e.printStackTrace();
            result.put("success",false);
            result.put("msg",e.getMessage());
        }
        return result;
    }

}
