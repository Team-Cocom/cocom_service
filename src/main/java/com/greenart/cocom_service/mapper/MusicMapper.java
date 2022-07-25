package com.greenart.cocom_service.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.greenart.cocom_service.data.MusicInsertInfo;

@Mapper
public interface MusicMapper {
    public void insertMusic(MusicInsertInfo data);
}
