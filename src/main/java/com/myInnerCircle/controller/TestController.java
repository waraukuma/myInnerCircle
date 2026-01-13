package com.myInnerCircle.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class TestController {

    @GetMapping("/")
    public String home() {
        return "index";
    }

    @GetMapping("/test")
    @ResponseBody
    public String test() {

        return "Test OK";
    }
}
