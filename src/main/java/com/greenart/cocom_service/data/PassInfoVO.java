package com.greenart.cocom_service.data;



import java.util.Date;

import lombok.Data;

@Data
public class PassInfoVO {
    private Integer ps_seq;
    private Integer ps_type;
    private Integer ps_mi_seq;
    private String ps_name;
    private Integer ps_price;
    private String ps_img_file;
    private Integer ps_period;
    private Long ps_mi_end_dt;
}
