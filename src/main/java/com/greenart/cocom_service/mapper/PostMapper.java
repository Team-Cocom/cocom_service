package com.greenart.cocom_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.NoticeInfoVO;

@Mapper
public interface PostMapper {
    public List<NoticeInfoVO> selectAllfromNoticeInfo(String keyword,Integer offset);
    public Integer selectNoticePageCnt(String keyword);
    public NoticeInfoVO selectNoticeInfoBySeq(Integer post_no);
    public List<NoticeInfoVO> selectAllNoticeInfo();
}
