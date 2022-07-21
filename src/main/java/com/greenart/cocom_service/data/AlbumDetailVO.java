package com.greenart.cocom_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class AlbumDetailVO {
    private Integer mu_seq;
    private String mu_name;
    private Integer mu_ai_seq;
    private String mu_lyrics;
    private Integer mu_ab_seq;
    private String mu_img_file;
    private String mu_music_file;
    private Integer mu_li_seq;
    private Integer mu_playtime;
    private String mu_explain_txt;
    private Integer mu_age;
    private Integer mu_str_seq;
    private Date mu_reg_dt;
    private Integer mu_gr_seq;
    private String mu_cr_seq;
    private Integer mu_is_confirm;
    private Integer ab_seq;
    private String ab_name;
    private String ab_img_file;
    private Date ab_re_dt;
    private Integer ab_ai_seq;
    private Integer ab_ent_seq;
    private Integer ab_rci_seq;
    private Integer ab_mu_seq;
    private String ab_txt;
    private Integer ab_age;
    private Integer ab_mv_seq;
    private Date ab_reg_dt;
    private Integer ab_acom_seq;
    private Integer ab_is_confirm;
    private String rci_name;
    private String ent_name;
    private String gr_name;
}
