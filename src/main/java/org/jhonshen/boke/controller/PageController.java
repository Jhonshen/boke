package org.jhonshen.boke.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("")
public class PageController {
    @RequestMapping("register")
    public String register(){
        return "fore/register";
    }
}
