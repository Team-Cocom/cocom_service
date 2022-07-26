package com.greenart.cocom_service.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greenart.cocom_service.mapper.MemberMapper;

@Controller
public class MemberController {
    @Autowired MemberMapper member_mapper;
    @GetMapping("/join")
    public String getMemberJoin() {
        return "/member/join";
    }
    @GetMapping("/myinfo/modify") 
    public String getMyinfoModify(Model model,@RequestParam Integer user_no) {
        model.addAttribute("list", member_mapper.selectMemberInfoBySeq(user_no));
        return "/member/info_detail";
    }
    
    @GetMapping("/mypage")
    public String getMyInfoPage(Model model,@RequestParam Integer member_no) {
        model.addAttribute("list", member_mapper.selectMemberInfoBySeq(member_no));
        return "/member/mypage";
    }
    @GetMapping("/music/upload")
    public String getMusicUploadPage(Model model,@RequestParam Integer member_no) {
        model.addAttribute("memberList", member_mapper.selectMemberAndArtistInfo(member_no));
        model.addAttribute("genreList", member_mapper.selectGenreInfos());
        return "/member/music_upload";
    }

}
