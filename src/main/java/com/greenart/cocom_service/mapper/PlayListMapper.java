package com.greenart.cocom_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.PlayListInfoVO;
import com.greenart.cocom_service.data.PlayListToMemberVO;

@Mapper
public interface PlayListMapper {
    public void insertPlayListInfo(PlayListInfoVO data);
    public List<PlayListToMemberVO> selectPlayListToMember(Integer seq);
    public void deleteMusicFromList(Integer mi_seq, Integer mu_seq);
}
