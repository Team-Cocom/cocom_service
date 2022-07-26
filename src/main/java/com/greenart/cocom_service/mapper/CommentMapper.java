package com.greenart.cocom_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.AlbumComDetails;
import com.greenart.cocom_service.data.AlbumCommentVO;
import com.greenart.cocom_service.data.CommentLikeVO;

@Mapper
public interface CommentMapper {
    public void insertAlbumComments(AlbumCommentVO data);
    public void updateAlbumComment(AlbumCommentVO data);
    public void deleteAlbumComment(Integer seq);

    public List<AlbumComDetails> selectAlbumCommentsBySeq(Integer seq, Integer offset);
    public Integer selectAlbumCommentPageCount(Integer seq);
    public Integer selectAlbumCommentsCount(Integer seq);
    public AlbumCommentVO selectAlbumCommentByMember(Integer seq, Integer ab_seq);

    public void insertCommentLike(CommentLikeVO data);
    public CommentLikeVO selectCommentInfo(CommentLikeVO data);
    public void updateCommentLike(CommentLikeVO data);

    public Double selectAlbumAvgScore(Integer seq);
    public void insertReportInfo(Integer mi_seq, Integer acom_seq, Integer reason);
    public Boolean isReported(Integer mi_seq, Integer acom_seq);
}

