package com.greenart.cocom_service.api;

import java.time.LocalDate;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.greenart.cocom_service.data.ArtistInfoVO;
import com.greenart.cocom_service.data.MemberInfoVO;
import com.greenart.cocom_service.data.PassInfoVO;
import com.greenart.cocom_service.mapper.MemberMapper;
import com.greenart.cocom_service.mapper.PassMapper;
import com.greenart.cocom_service.mapper.PlayListMapper;
import com.greenart.cocom_service.util.AESAlgorithm;

@RestController
@RequestMapping("/api/member")
public class MemberAPIController {
    @Autowired PlayListMapper play_list_mapper;
    @Autowired PassMapper pass_mapper;
    @Autowired MemberMapper member_mapper;
    @PutMapping("/join")
    public ResponseEntity<Map<String, Object>> putMemberJoin(@RequestBody MemberInfoVO data) throws Exception{
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        data.setMi_pwd(AESAlgorithm.Encrypt(data.getMi_pwd()));
        try {
            member_mapper.joinMember(data);
            if(data.getMi_role() == 2){
                ArtistInfoVO artist = new ArtistInfoVO();
                artist.setAi_mi_seq(data.getMi_seq());
                artist.setAi_name(data.getMi_name());
                artist.setAi_img_file(data.getMi_profile_img());
                member_mapper.insertMemberInfoToArtist(artist);
            }
        }
        catch(Exception e) {
            if(e.getMessage().indexOf("Duplicate") > 0 ) {
                resultMap.put("message", data.getMi_id()+"은(는) 이미 등록된 ID 입니다.");
                resultMap.put("status", false);
                return new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.CONFLICT);
            }
            resultMap.put("message", "내부오류가 발생했습니다.");
            resultMap.put("status", false);
            e.printStackTrace();
            return new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.INTERNAL_SERVER_ERROR);
        }
        resultMap.put("message","회원가입이 완료되엇습니다.");
        resultMap.put("status", true);

        return new ResponseEntity<Map<String,Object>>(resultMap, HttpStatus.CREATED);
    }
    
    @GetMapping("/id_chk")
    public Boolean getMemberIDCheck(@RequestParam String id) {
        return member_mapper.IsDuplicateCheck(id) == 1;
    }
    
    @GetMapping("/phone_chk")
    public Boolean getMemberPhoneCheck(@RequestParam String phone_no) {
        return member_mapper.isDuplicatePhone(phone_no) ==  1;
    }

    @PostMapping("/login")
    public Map<String, Object> postAccountLogin(@RequestBody MemberInfoVO data, HttpSession session) throws Exception {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        
        data.setMi_pwd(AESAlgorithm.Encrypt(data.getMi_pwd()));
        MemberInfoVO user = member_mapper.login(data);
        
        if(user == null) {
            resultMap.put("status", false);
            resultMap.put("message", "아이디 또는 비밀번호 오류입니다.");
            return resultMap;
        }

        session.setAttribute("user", user);
        resultMap.put("status", true);
        resultMap.put("message", "로그인 되었습니다.");
        return resultMap;
    }

    @GetMapping("/login")
    public Map<String,Object> getLogin(HttpSession session){
        Map<String,Object> resultMap = new LinkedHashMap<String,Object>();
        resultMap.put("user", session.getAttribute("user"));
        return resultMap;
    }

    @GetMapping("/user")
    public Map<String,Object> getuser(HttpSession session){
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        MemberInfoVO member = (MemberInfoVO)session.getAttribute("user");
        if(member == null){
            return resultMap;
        }
        MemberInfoVO member_pass = pass_mapper.selectMemberInfoBySeq(member.getMi_seq());
        Integer passMember = pass_mapper.passMemberInfo(member_pass.getMi_ps_seq());
        if(passMember == null && member_pass.getMi_ps_seq() != 0){
            pass_mapper.updateAfterPassInfo(member_pass.getMi_seq());
            session.setAttribute("playList", null);
            return resultMap;
        }
        if( member_pass.getMi_ps_seq() == 0){
            return resultMap;
        }
        session.setAttribute("playList", play_list_mapper.selectPlayListToMember(member_pass.getMi_seq()));
        return resultMap;
    }

    @PatchMapping("/modify")
    public Map<String, Object> patchMemberLogin(@RequestBody MemberInfoVO data, @RequestParam @Nullable Integer seq) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        if(data.getMi_pwd() == null || data.getMi_pwd().equals("")) {
            resultMap.put("status", false);
            resultMap.put("message", "비밀번호를 입력하지 않았습니다.");
            return resultMap;
        }
        member_mapper.updateMemberInfos(data);
        resultMap.put("status", true);
        resultMap.put("message", "계정 정보를 수정하였습니다.");
            return resultMap;
    }
    @PatchMapping("/delete/profile_img")
    public Map<String,Object> patchProfileImg(@RequestParam Integer seq){
        Map<String,Object> resultMap = new LinkedHashMap<String,Object>();
        member_mapper.deleteProfileImg(seq);
        resultMap.put("message", "프로필 이미지 삭제를 완료하였습니다.");
        return resultMap;
    }
}
