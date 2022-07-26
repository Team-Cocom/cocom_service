package com.greenart.cocom_service.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greenart.cocom_service.data.MemberInfoVO;
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

    
    @GetMapping("/member/comment")
    public String getAccountComment(
        HttpSession session, @RequestParam @Nullable Integer page, Model model
        ) {
        MemberInfoVO user = (MemberInfoVO)session.getAttribute("user");
        if(user == null) {
            return "redirect:/login";
        }
        if(page == null) page =1;
        model.addAttribute("list", member_mapper.selectCommentsByMemberSeq(user.getMi_seq(), (page-1)*10));
        model.addAttribute("pageCnt", member_mapper.selectCommentsPageCountByMemberSeq(user.getMi_seq()));
        model.addAttribute("totalCnt",member_mapper.selectCommentsCountByMemberSeq(user.getMi_seq()));
        model.addAttribute("currentPage",page);
        return "/member/comment";
    }

}
