package com.greenart.cocom_service.controller;

<<<<<<< HEAD
<<<<<<< HEAD

import java.util.ArrayList;
import java.util.LinkedHashMap;
=======
>>>>>>> d520f31a98355d50a160909985c4d6d0fe14fa1c
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
=======
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
>>>>>>> doodo_work
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greenart.cocom_service.data.adminMusicIndex;
import com.greenart.cocom_service.data.adminRecommendIndex;
import com.greenart.cocom_service.mapper.MainMapper;

import com.greenart.cocom_service.mapper.MainMapper;

@Controller
public class MainController {
<<<<<<< HEAD
    @Autowired MainMapper main_mapper;
    @GetMapping("/")
    public String getMain(Model model,@RequestParam @Nullable Integer seq){
        if(seq==null) seq =0;
        adminRecommendIndex recommend_list = main_mapper.selectAllFromAlbumIndex(seq);
        List<adminMusicIndex> music_list = main_mapper.selectAllFromMusicIndex(recommend_list.getArd_title());
        model.addAttribute("list", main_mapper.selectAllNewMusic());
        model.addAttribute("music_genre_list", main_mapper.selectAllMusicFromGenre());
        model.addAttribute("album_list", main_mapper.selectAllAlbum());
        model.addAttribute("recommend_list", recommend_list);
        model.addAttribute("music_list", music_list);
        return "/index";
    }
<<<<<<< HEAD
=======
 
>>>>>>> doodo_work
=======

    @GetMapping("/login")
    public String getLogin(){
        return "/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
>>>>>>> d520f31a98355d50a160909985c4d6d0fe14fa1c
}