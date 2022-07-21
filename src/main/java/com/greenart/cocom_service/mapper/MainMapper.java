package com.greenart.cocom_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

<<<<<<< HEAD
import com.greenart.cocom_service.data.AlbumSummary;
import com.greenart.cocom_service.data.MusicAndGenreSummary;
import com.greenart.cocom_service.data.MusicSummary;
import com.greenart.cocom_service.data.adminMusicIndex;
import com.greenart.cocom_service.data.adminRecommendIndex;

@Mapper
public interface MainMapper {
    public List<adminRecommendIndex> selectAllFromAlbumIndex();
    public List<adminMusicIndex> selectAllFromMusicIndex(String title);
    public List<Integer> selectCountALLRecommendMusic();
    public List<MusicSummary> selectAllNewMusic();
    public List<MusicAndGenreSummary> selectAllMusicFromGenre();
    public List<AlbumSummary> selectAllAlbum();
    
=======
import com.greenart.cocom_service.data.albumIndexPageVO;

@Mapper
public interface MainMapper {
    public List<albumIndexPageVO> selectAllFromAlbumIndex();
>>>>>>> doodo_work
}
