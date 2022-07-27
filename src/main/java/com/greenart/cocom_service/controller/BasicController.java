package com.greenart.cocom_service.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;
import com.greenart.cocom_service.mapper.BasicMapper;
import com.greenart.cocom_service.mapper.LikeMapper;
import com.greenart.cocom_service.service.MusicService;

@Controller
public class BasicController {
    @Autowired MusicService music_service;
    @Autowired BasicMapper basic_mapper;
    @Autowired LikeMapper like_mapper;
    @GetMapping("/music/detail")
    public String musicDetailList(Model model, @RequestParam @Nullable Integer music_no) {
        
        model.addAttribute("list", basic_mapper.selectMusicDetail(music_no));
        model.addAttribute("Like", like_mapper.selectMusicLikeCount(music_no));
        return "/basic/music_detail";
    }
    @GetMapping("/album/detail")
    public String albumDetail(Model model, @RequestParam @Nullable Integer album_no
    ,@RequestParam @Nullable Integer user_no, HttpSession session
    ) {
        model.addAttribute("data", music_service.getMusicInfoAll(album_no, session));
        model.addAttribute("list", basic_mapper.selectAlbumDetail(album_no));
        model.addAttribute("Like", like_mapper.selectAlbumLikeCount(album_no));
        return "/basic/album_detail";
    }
    @GetMapping("/mymusic/list")
    public String myMusicList(Model model) {
        return "/basic/mymusic";
    }
    @GetMapping("/genre/detail")
    public String genreDetail(Model model, @RequestParam @Nullable Integer genre_no) {
        model.addAttribute("list", basic_mapper.selectGenreDetail(genre_no));
        return "/basic/genre_detail";
    }
    @GetMapping("/music/list")
    public String musicList(Model model, @RequestParam @Nullable String keyword) {
        
        model.addAttribute("keyword", basic_mapper.selectMusicList(keyword));
        return "/basic/music_list";
    }
}
