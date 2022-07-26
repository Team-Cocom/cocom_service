package com.greenart.cocom_service.data;

import lombok.Data;

@Data
public class MemberAndArtistVO {
    private Integer mi_seq;
    private String mi_id;
    private String mi_name;
    private Integer ai_seq;
    private String ai_name;
    private Integer ai_cr_seq;
}
