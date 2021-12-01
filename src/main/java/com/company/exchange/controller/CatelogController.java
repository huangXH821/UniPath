package com.company.exchange.controller;

import com.company.exchange.service.CatelogService;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller
public class CatelogController {
    @Resource
    private CatelogService catelogService;

}
