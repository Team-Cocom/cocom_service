package com.greenart.cocom_service.data;

import lombok.Data;

@Data
public class PassInfoVO {
    private Integer ps_seq;
    private Integer ps_type;
    private String ps_name;
    private Integer ps_price;
    private String ps_img_file;
    private Integer ps_period;
}
