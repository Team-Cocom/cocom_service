package com.greenart.cocom_service.service;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.greenart.cocom_service.data.MemberInfoVO;
import com.greenart.cocom_service.mapper.CommentMapper;

@Service
public class MusicService {
    @Autowired CommentMapper comment_mapper;
    public Map<String,Object> getMusicInfoAll(Integer seq, HttpSession session) {
        Map<String,Object> resultMap = new LinkedHashMap<String,Object>();
        Double score = comment_mapper.selectAlbumAvgScore(seq);
        resultMap.put("score", score);
        MemberInfoVO user = (MemberInfoVO)session.getAttribute("user");
        if(user != null) {

            resultMap.put("user_comment", comment_mapper.selectAlbumCommentByMember(user.getMi_seq(), seq));
        }
        return resultMap;
    }
}