package com.greenart.cocom_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.greenart.cocom_service.data.ArtistVO;
import com.greenart.cocom_service.data.MemberInfoVO;
import com.greenart.cocom_service.mapper.MemberMapper;
import com.greenart.cocom_service.util.AESAlgorithm;

@RestController
@RequestMapping("/api/member")
public class MemberAPIController {
    @Autowired MemberMapper member_mapper;
    @PutMapping("/join")
    public ResponseEntity<Map<String, Object>> putMemberJoin(@RequestBody MemberInfoVO data) throws Exception{
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        data.setMi_pwd(AESAlgorithm.Encrypt(data.getMi_pwd()));
        try {
            member_mapper.joinMember(data);
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

    @PatchMapping("/update")
    public Map<String, Object> patchMemberLogin(@RequestBody MemberInfoVO data) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        if(data.getMi_seq() == null) {
            resultMap.put("status", false);
            resultMap.put("message","사용자 번호가 입력되지 않았습니다.");
            return resultMap;
        }
        if(data.getMi_pwd() == null || data.getMi_pwd().equals("")) {
            resultMap.put("status", false);
            resultMap.put("message", "비밀번호를 입력하지 않았습니다.");
            return resultMap;
        }
        if(data.getMi_name()== null || data.getMi_name().equals("")) {
            resultMap.put("status", false);
            resultMap.put("message", "이름을 입력하지 않았습니다.");
            return resultMap;
        }
        if(data.getMi_role()== null || data.getMi_role().equals("")) {
            resultMap.put("status", false);
            resultMap.put("message", "계정 가입 유형을 입력하지 않았습니다.");
            return resultMap;
        }
        member_mapper.updateMemberInfos(data);
        resultMap.put("status", true);
        resultMap.put("message", "계정 정보를 수정하였습니다.");
            return resultMap;
    }
}
