package com.greenart.cocom_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.greenart.cocom_service.data.MemberInfoVO;
import com.greenart.cocom_service.data.PlayListInfoVO;
import com.greenart.cocom_service.mapper.PassMapper;
import com.greenart.cocom_service.mapper.PlayListMapper;

@RestController
@RequestMapping("/api")
public class PlayListAPIController {
    @Autowired PassMapper pass_mapper;
    @Autowired PlayListMapper playList_mapper;
    @PutMapping("/palylist/add")
    public Map<String,Object> putPlayList(HttpSession session,@RequestParam Integer seq){
        Map<String,Object> resultMap = new LinkedHashMap<String,Object>();
        MemberInfoVO member = (MemberInfoVO)session.getAttribute("user");
        if(member == null){
            resultMap.put("status", false);
            resultMap.put("message","로그인이 필요한 서비스입니다.");
            return resultMap;
        }
        MemberInfoVO member_pass = pass_mapper.selectMemberInfoBySeq(member.getMi_seq());
        if(member_pass.getMi_ps_seq() == null){
            resultMap.put("status", false);
            resultMap.put("message","이용권을 구매해주세요.");
            return resultMap;
        }
        if(member_pass.getMi_ps_seq() == 0 ){
            resultMap.put("status", false);
            resultMap.put("message","이용권기간이 만료되었습니다.");
            return resultMap;
        }
        PlayListInfoVO play_list = new PlayListInfoVO();
        play_list.setPls_mi_seq(member_pass.getMi_seq());
        play_list.setPls_mu_seq(seq);
        playList_mapper.insertPlayListInfo(play_list);
        resultMap.put("status", true);
        resultMap.put("message","재생목록에 노래를 추가하였습니다.\n중복 노래는 제외됩니다");
        return resultMap;
    }
}
