package com.greenart.cocom_service.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.albumIndexPageVO;

@Mapper
public interface MainMapper {
    public List<albumIndexPageVO> selectAllFromAlbumIndex();
}
