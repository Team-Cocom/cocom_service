package com.greenart.cocom_service.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greenart.cocom_service.mapper.BasicMapper;

@Controller
public class BasicController {
    @Autowired BasicMapper basic_mapper;
    @GetMapping("/music/detail")
    public String musicDetailList(Model model, @RequestParam @Nullable Integer music_no) {
        model.addAttribute("list", basic_mapper.selectMusicDetail(music_no));
        System.out.println(basic_mapper.selectMusicDetail(music_no));
        
        return "/basic/music_detail";
    }
}
