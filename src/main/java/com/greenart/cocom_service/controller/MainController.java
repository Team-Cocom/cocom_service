package com.greenart.cocom_service.controller;

<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> doodo_work
=======
>>>>>>> e50ce01f8c9ba1202199c70ec1f992690af1751a

=======
>>>>>>> doodo_work
import java.util.ArrayList;
import java.util.LinkedHashMap;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
<<<<<<< HEAD
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
=======

>>>>>>> e50ce01f8c9ba1202199c70ec1f992690af1751a
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
    @Autowired MainMapper main_mapper;
    @GetMapping("/")
    public String getMain(Model model){
        List<adminRecommendIndex> recommend_list = main_mapper.selectAllFromAlbumIndex();
        List<adminMusicIndex> music_list_frist = main_mapper.selectAllFromMusicIndex(recommend_list.get(0).getArd_title());
        List<adminMusicIndex> music_list_second = main_mapper.selectAllFromMusicIndex(recommend_list.get(1).getArd_title());
        List<adminMusicIndex> music_list_third = main_mapper.selectAllFromMusicIndex(recommend_list.get(2).getArd_title());
        List<adminMusicIndex> music_list_fourth = main_mapper.selectAllFromMusicIndex(recommend_list.get(3).getArd_title());
        List<adminMusicIndex> music_list_fifth = main_mapper.selectAllFromMusicIndex(recommend_list.get(4).getArd_title());
        



        model.addAttribute("recommend_list", recommend_list);
        model.addAttribute("Cnt", main_mapper.selectCountALLRecommendMusic());
        model.addAttribute("music_list_frist", music_list_frist);
        model.addAttribute("music_list_second", music_list_second);
        model.addAttribute("music_list_third", music_list_third);
        model.addAttribute("music_list_fourth", music_list_fourth);
        model.addAttribute("music_list_fifth", music_list_fifth);


        model.addAttribute("list", main_mapper.selectAllNewMusic());
        model.addAttribute("music_genre_list", main_mapper.selectAllMusicFromGenre());
        model.addAttribute("album_list", main_mapper.selectAllAlbum());
        return "/index";
    }
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
<<<<<<< HEAD
=======
=======
>>>>>>> e50ce01f8c9ba1202199c70ec1f992690af1751a
 
=======
>>>>>>> doodo_work

    @GetMapping("/login")
    public String getLogin(){
        return "/login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        session.invalidate();
        return "redirect:/";
    }
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> d520f31a98355d50a160909985c4d6d0fe14fa1c
=======
>>>>>>> doodo_work
=======

>>>>>>> e50ce01f8c9ba1202199c70ec1f992690af1751a
=======
>>>>>>> doodo_work
}
