package com.greenart.cocom_service.mapper;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface LikeMapper {
    public void insertMusicLike(Integer mu_seq, Integer mi_seq);
    public Integer selectMusicLikeCount(Integer mu_seq);
    public Integer selectLikeMember(Integer mu_seq, Integer mi_seq);

    public void insertAlbumLike(Integer ab_seq, Integer mi_seq);
    public Integer selectAlbumLikeCount(Integer ab_seq);
    public Integer selectLikeMemberAlbum(Integer ab_seq, Integer mi_seq);
}
