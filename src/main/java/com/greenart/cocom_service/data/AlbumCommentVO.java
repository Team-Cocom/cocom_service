package com.greenart.cocom_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class AlbumCommentVO {
    private Integer acom_seq;
    private Integer acom_mi_seq;
    private Integer acom_star_score;
    private Integer acom_li_seq;
    private Integer acom_rep_seq;
    private String acom_text;
    private Date acom_reg_dt;
    private Date acom_mod_dt;
    private Integer acom_ab_seq;
    
    private Integer like_cnt;
}
