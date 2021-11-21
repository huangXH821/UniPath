package com.company.exchange.controller;

import com.company.exchange.pojo.User;
import com.company.exchange.service.UserService;
import com.company.exchange.util.UserGrid;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

@Controller
public class MainController {

    @Resource
    private UserService userService;


    @RequestMapping("/")
    public String index() {
        //return "index";
        return "manage";
    }



    @RequestMapping(value = "/userList")
    @ResponseBody
    public UserGrid getUserList(@RequestParam("current") int current, @RequestParam("rowCount") int rowCount) {
        int total = userService.getUserNum();
        List<User> list = userService.getPageUser(current, rowCount);
        UserGrid userGrid = new UserGrid();
        userGrid.setCurrent(current);
        userGrid.setRowCount(rowCount);
        userGrid.setRows(list);
        userGrid.setTotal(total);
        return userGrid;
    }
}
