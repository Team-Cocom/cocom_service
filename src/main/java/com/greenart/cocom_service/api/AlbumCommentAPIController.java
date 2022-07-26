package com.greenart.cocom_service.api;

import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.greenart.cocom_service.data.AlbumCommentVO;
import com.greenart.cocom_service.data.CommentLikeVO;
import com.greenart.cocom_service.data.MemberInfoVO;
import com.greenart.cocom_service.mapper.CommentMapper;

@RestController
@RequestMapping("/api/album")
public class AlbumCommentAPIController {
    @Autowired CommentMapper comment_mapper;
    @PutMapping("/comment")
    public Map<String, Object> putAlbumComment(@RequestBody AlbumCommentVO data) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        comment_mapper.insertAlbumComments(data);
        resultMap.put("status", true);
        resultMap.put("message", "댓글이 등록되었습니다.");
        return resultMap;
    }

    @PatchMapping("/comment")
    public Map<String, Object> patchAlbumComment(@RequestBody AlbumCommentVO data) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        comment_mapper.updateAlbumComment(data);
        resultMap.put("status", true);
        resultMap.put("message", "댓글이 수정되었습니다.");
        return resultMap;
    }

    @DeleteMapping("/comment")
    public Map<String, Object> deleteAlbumComment(@RequestParam Integer seq) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        comment_mapper.deleteAlbumComment(seq);
        resultMap.put("status", true);
        resultMap.put("message", "댓글이 삭제되었습니다.");
        return resultMap;
    }

    @GetMapping("/comment/list")
    public Map<String, Object> selectAlbumCommentList(
        @RequestParam Integer seq, @RequestParam Integer page) {
        if(page == null) page = 1;
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        resultMap.put("totalCount", comment_mapper.selectAlbumCommentsCount(seq));
        resultMap.put("pageCount", comment_mapper.selectAlbumCommentPageCount(seq));
        resultMap.put("currentPage", page);
        resultMap.put("list", comment_mapper.selectAlbumCommentsBySeq(seq, (page-1)*10));
        return resultMap;
    }        

    @PutMapping("/comment/like")
    public Map<String, Object> putCommentLikeInfo(@RequestBody CommentLikeVO data) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        
        CommentLikeVO comment = comment_mapper.selectCommentInfo(data);
        if(comment == null) {
            comment_mapper.insertCommentLike(data);
            resultMap.put("status", true);
            resultMap.put("message", "댓글 좋아요 정보 추가");
            return resultMap;
        }
        else if(data.getCl_like()!= comment.getCl_like()){
            comment_mapper.updateCommentLike(data);
            resultMap.put("status", true);
            resultMap.put("message", "댓글 좋아요 정보 수정");
            return resultMap;
        }
        resultMap.put("status", false);
        resultMap.put("message", "이미 댓글에 좋아요를 등록하였습니다. ");
        return resultMap;
    }

    @PutMapping("/comment/report")
    public Map<String, Object> putCommentReport(HttpSession session, @RequestParam Integer reason, @RequestParam Integer acom_seq) {
        Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
        MemberInfoVO user = (MemberInfoVO)session.getAttribute("user");
        if(user == null) {
            resultMap.put("status", false);
            resultMap.put("message", "로그인 후 사용할 수 있습니다.");
            return resultMap;
        }
        if(comment_mapper.isReported(user.getMi_seq(), acom_seq)) {
            resultMap.put("status", false);
            resultMap.put("message", "이미 신고한 댓글 입니다.");
            return resultMap;
        }
        comment_mapper.insertReportInfo(user.getMi_seq(), acom_seq, reason);
            resultMap.put("status", true);
            resultMap.put("message", "댓글 신고가 등록되었습니다.");
            return resultMap;
    }
}
