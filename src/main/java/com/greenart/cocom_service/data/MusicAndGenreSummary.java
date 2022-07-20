package com.greenart.cocom_service.data;

import lombok.Data;

@Data
public class MusicAndGenreSummary {
    private Integer mu_seq;
    private String mu_name;
    private String mu_img_file;
    private Integer gr_seq;
    private String gr_name;
}
