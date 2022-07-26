package com.greenart.cocom_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.greenart.cocom_service.data.ArtistInfoVO;
import com.greenart.cocom_service.data.MemberInfoVO;
import com.greenart.cocom_service.data.MusicInsertInfo;
import com.greenart.cocom_service.mapper.MemberMapper;
import com.greenart.cocom_service.mapper.MusicMapper;

@RestController
@RequestMapping("/api")
public class MusicAPIController {
    @Autowired MemberMapper member_mapper;
    @Autowired MusicMapper music_mapper;
    @PutMapping("/music/add")
    @Transactional
    public Map<String,Object> putMusic(HttpSession session,@RequestBody MusicInsertInfo data){
        Map<String,Object> resultMap = new LinkedHashMap<String,Object>();
        MemberInfoVO member = (MemberInfoVO)session.getAttribute("user");
        ArtistInfoVO artist = new ArtistInfoVO();
        if(data.getMu_ai_seq() == null){
            artist.setAi_img_file(member.getMi_profile_img());
            artist.setAi_mi_seq(member.getMi_seq());
            artist.setAi_name(member.getMi_name());
            member_mapper.insertMemberInfoToArtist(artist);

            data.setMu_ai_seq(artist.getAi_seq());
        }
        music_mapper.insertMusic(data);
        resultMap.put("status", true);
        resultMap.put("message", "업로드 신청이 완료되었습니다");
        return resultMap;
    }
}
