package com.greenart.cocom_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.ArtistVO;
import com.greenart.cocom_service.data.MemberInfoVO;

@Mapper
public interface MemberMapper {
    public MemberInfoVO login(MemberInfoVO data);

    public void insertMember(MemberInfoVO data);
    public void joinMember(MemberInfoVO data);
    
    public Integer isDuplicatedId(String id);
    public Integer isDuplicatedPhone(Integer phone);
    public Integer IsDuplicateCheck(String id);

    public List<MemberInfoVO> selectMemberInfo();
    public MemberInfoVO selectMemberInfoBySeq(Integer user_no);
    public void updateMemberInfos(MemberInfoVO data);


}
