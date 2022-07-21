package com.greenart.cocom_service.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.greenart.cocom_service.mapper.PassMapper;

@Controller
public class PassController {
    @Autowired PassMapper pass_mapper;
    @GetMapping("/pass")
    public String getPassInfo(Model model){
        model.addAttribute("list", pass_mapper.selectAllNomalPass());
        return "/pass/pass_list";
    }
}
