package com.greenart.cocom_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.AlbumComDetails;
import com.greenart.cocom_service.data.ArtistInfoVO;
import com.greenart.cocom_service.data.MemberInfoVO;

@Mapper
public interface MemberMapper {
    public MemberInfoVO login(MemberInfoVO data);

    public void joinMember(MemberInfoVO data);
    public void insertMemberInfoToArtist(ArtistInfoVO data);
    
    public Integer isDuplicatedId(String id);
    public Integer isDuplicatePhone(String phone_no);
    public Integer IsDuplicateCheck(String id);

    public List<MemberInfoVO> selectMemberInfo();
    public MemberInfoVO selectMemberInfoBySeq(Integer user_no);
    public void updateMemberInfos(MemberInfoVO data);
    public void deleteProfileImg(Integer seq);

    public List<AlbumComDetails> selectCommentsByMemberSeq(Integer seq, Integer offset);
    public Integer selectCommentsPageCountByMemberSeq(Integer seq);
    public Integer selectCommentsCountByMemberSeq(Integer seq);
}
