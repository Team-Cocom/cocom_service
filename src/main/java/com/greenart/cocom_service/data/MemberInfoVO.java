package com.greenart.cocom_service.data;

import java.util.Date;

import lombok.Data;

@Data
public class MemberInfoVO {
    private Integer mi_seq;
    private String mi_id;
    private String mi_pwd;
    private String mi_name;
    private Date mi_birth;
    private String mi_addr;
    private Integer mi_role;
    private String mi_profile_img;
    private String mi_nickname;
    private String mi_ip;
    private Date mi_reg_dt;
    private Date mi_mod_dt;
    private Integer mi_status;
    private Integer mi_use;
    private Integer mi_alim;
    private Integer mi_ps_seq;
    private Integer mi_gen;
    private String mi_phone;
}
