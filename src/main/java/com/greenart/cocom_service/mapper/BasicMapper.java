package com.greenart.cocom_service.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.MusicInfoVO;

@Mapper
public interface BasicMapper {
    public MusicInfoVO selectMusicDetail(Integer seq);
}
