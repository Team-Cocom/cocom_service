package com.greenart.cocom_service.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greenart.cocom_service.mapper.PostMapper;

@Controller
public class AdminController {
    @Autowired PostMapper post_mapper;
    @GetMapping("/notice")
    public String noticelist(Model model, @RequestParam @Nullable String keyword,
    @RequestParam @Nullable Integer page) 
        
    {
        if(page==null) page=1;
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("list", post_mapper.selectAllfromNoticeInfo(keyword, (page-1)*10));
        model.addAttribute("pageCount", post_mapper.selectNoticePageCnt(keyword));
        return "/notice";
    }
    @GetMapping("/notice/detail")
    public String getPostDetail(Model model, @RequestParam Integer post_no) {
        model.addAttribute("noticeList", post_mapper.selectNoticeInfoBySeq(post_no));
        return "/notice_detail";
    }
}
