package com.greenart.cocom_service.data;

import lombok.Data;

@Data
public class MusicListVO {
    private Integer mu_seq;
    private String mu_name;
    private String mu_img_file;
    private String mu_lyrics;
    private String ab_name;
}
