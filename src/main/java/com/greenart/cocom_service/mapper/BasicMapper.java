package com.greenart.cocom_service.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.AlbumDetailVO;
import com.greenart.cocom_service.data.MusicDetailVO;
import com.greenart.cocom_service.data.MusicInfoVO;

@Mapper
public interface BasicMapper {
    public MusicDetailVO selectMusicDetail(Integer seq);
    public List<AlbumDetailVO> selectAlbumDetail(Integer seq);
    

}
