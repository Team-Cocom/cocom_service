package com.greenart.cocom_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.greenart.cocom_service.data.MemberInfoVO;
import com.greenart.cocom_service.data.PassInfoVO;
import com.greenart.cocom_service.mapper.PassMapper;

@RestController
@RequestMapping("/api")
public class PassAPIController {
    @Autowired PassMapper pass_mapper;
    @PutMapping("/pass/nomal/buy")
    @Transactional
    public Map<String,Object> putPassInfo(@RequestParam Integer seq,@RequestParam Integer ps_seq){
        Map<String,Object> resultMap = new LinkedHashMap<String,Object>();
        MemberInfoVO member = pass_mapper.selectMemberInfoBySeq(seq);
        PassInfoVO originPass = pass_mapper.selectPassInfoBySeq(ps_seq);
        if(member.getMi_ps_seq() != null && member.getMi_ps_seq() >= 1){
            resultMap.put("status", false);
            resultMap.put("message", "이미 "+originPass.getPs_name()+" 를 사용중입니다.");
            return resultMap;
        }
        PassInfoVO passBuy = new PassInfoVO();
        passBuy.setPs_type(originPass.getPs_type());
        passBuy.setPs_name(originPass.getPs_name());
        passBuy.setPs_price(originPass.getPs_price());
        passBuy.setPs_period(originPass.getPs_period());
        passBuy.setPs_mi_seq(member.getMi_seq());

        pass_mapper.insertPassToMember(passBuy);
        // 
        pass_mapper.updateMemberPass(member.getMi_seq(), passBuy.getPs_seq());
        resultMap.put("status", true);
        resultMap.put("message", passBuy.getPs_name()+" 를 구매하셨습니다.");
        return resultMap;
    }
}
