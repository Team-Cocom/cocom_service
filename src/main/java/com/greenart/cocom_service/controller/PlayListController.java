package com.greenart.cocom_service.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.greenart.cocom_service.data.MemberInfoVO;
import com.greenart.cocom_service.mapper.PlayListMapper;

@Controller
public class PlayListController {
    @Autowired PlayListMapper play_list_mapper;
    @GetMapping("/myPlayList")
    public String getMyPlayList(HttpSession session,Model model){
        MemberInfoVO member = (MemberInfoVO)session.getAttribute("user");
        if(member == null){
            return "redirect:/";
        }
        model.addAttribute("list", play_list_mapper.selectPlayListToMember(member.getMi_seq()));
        return "/myPlayList";
    }
}
