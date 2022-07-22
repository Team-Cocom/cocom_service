package com.greenart.cocom_service.data;

import lombok.Data;

@Data
public class PlayListToMemberVO {
    private Integer mu_seq;
    private Integer mi_seq;
    private Integer mi_ps_seq;
    private Integer pls_seq;
    private Integer pls_mi_seq;
    private Integer pls_mu_seq;
    private String mu_name;
    private String mu_img_file;
    private String mu_music_file;
    private String ai_name;
}
