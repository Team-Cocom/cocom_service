package com.greenart.cocom_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
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
}
