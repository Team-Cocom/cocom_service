package com.greenart.cocom_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class AlbumComDetails {
    private Integer acom_seq;
    private Integer acom_ab_seq;
    private Integer acom_star_score;
    private Integer acom_li_seq;
    private Integer acom_rep_seq;
    private String acom_text;
    private Date acom_reg_dt;
    private Date acom_mod_dt;
    private Integer acom_mi_seq;
    
    private String mi_id;
    private String mi_name;
    private String mi_nickname;
    private String mi_profile_img;
    private Integer like_cnt;
    private String ab_name;
}
