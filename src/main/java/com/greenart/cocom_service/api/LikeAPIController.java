package com.greenart.cocom_service.api;

import java.util.LinkedHashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.greenart.cocom_service.mapper.LikeMapper;


@RestController
@RequestMapping("/api")
public class LikeAPIController {
    @Autowired LikeMapper like_mapper;
    @PutMapping("/music_like")
        public Map<String,Object> putMusicLike(@RequestParam Integer mu_seq, @RequestParam Integer mi_seq){
            Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
            Integer duplicate = like_mapper.selectLikeMember(mu_seq, mi_seq);
            if(duplicate >= 1){
                resultMap.put("status", false);
                resultMap.put("message", "이미 좋아요한 곡입니다.");
                return resultMap;
            }
            like_mapper.insertMusicLike(mu_seq, mi_seq);
            resultMap.put("status", true);
            resultMap.put("message", "좋아요!");
            return resultMap;
        }
    @PutMapping("/album_like")
        public Map<String,Object> putAlbumLike(@RequestParam Integer ab_seq, @RequestParam Integer mi_seq){
            Map<String, Object> resultMap = new LinkedHashMap<String, Object>();
            Integer duplicate = like_mapper.selectLikeMemberAlbum(ab_seq, mi_seq);
            if(duplicate >= 1){
                resultMap.put("status", false);
                resultMap.put("message", "이미 좋아요한 앨범입니다.");
                return resultMap;
            }
            like_mapper.insertAlbumLike(ab_seq, mi_seq);
            resultMap.put("status", true);
            resultMap.put("message", "좋아요!");
            return resultMap;
        }
}
