package com.greenart.cocom_service.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.AlbumDetailVO;
import com.greenart.cocom_service.data.GenrePlaylistVO;
import com.greenart.cocom_service.data.MusicDetailVO;
<<<<<<< HEAD
=======
import com.greenart.cocom_service.data.MusicListVO;
>>>>>>> 4eb8c32cdaedb50613ba200337ecb8b5f330c3e8

@Mapper
public interface BasicMapper {
    public MusicDetailVO selectMusicDetail(Integer seq);
    public List<AlbumDetailVO> selectAlbumDetail(Integer seq);
    public List<GenrePlaylistVO> selectGenreDetail(Integer seq);
    
    public List<MusicListVO> selectMusicList(String keyword);
    

}
