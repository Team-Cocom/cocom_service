package com.greenart.cocom_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.MemberInfoVO;
import com.greenart.cocom_service.data.PassInfoVO;

@Mapper
public interface PassMapper {
    public List<PassInfoVO> selectAllNomalPass();
    public PassInfoVO selectPassInfoBySeq(Integer ps_seq);
    public MemberInfoVO selectMemberInfoBySeq(Integer seq);
    public void inertPassToMember(PassInfoVO data);
    public void updateMemberPass(Integer mi_seq,Integer mi_ps_seq);
    public Integer passMemberInfo(Integer seq);
    public void deletePassInfo(Integer seq);
    public void updateAfterPassInfo(Integer seq);
}
