package com.greenart.cocom_service.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.AlbumDetailVO;
import com.greenart.cocom_service.data.GenrePlaylistVO;
import com.greenart.cocom_service.data.MusicDetailVO;
import com.greenart.cocom_service.data.MusicListVO;

@Mapper
public interface BasicMapper {
    public MusicDetailVO selectMusicDetail(Integer seq);
    public List<AlbumDetailVO> selectAlbumDetail(Integer seq);
    public List<GenrePlaylistVO> selectGenreDetail(Integer seq);
    
    public List<MusicListVO> selectMusicList(String keyword);
    

}
