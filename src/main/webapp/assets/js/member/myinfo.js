let phone_check = false;
$(function(){
    $(".phone_mod_area").hide();
    $(".profile_prev_area").hide();

    $("#phone_mod_btn").click(function(){
        $(".phone_area").hide();
        $(".phone_mod_btn_area").hide();
        $(".phone_mod_area").show();
        $("#phone_dup_chk").show();
    })

    $("#profile_img_mod_save").click(function(){
        $(".profile_prev_area").show();
    })




    $("#profile_mod_img").change(function () {
        $(".profile_prev_area").hide();

        let form = $("#profile_img_mod_form");
        let formData = new FormData(form[0]);
        if ($(this).val() == '' || $(this).val() == null) return;

        $.ajax({
            url: "/images/upload/profile",
            type: "put",
            data: formData,
            contentType: false,
            processData: false,
            success: function (result) {
                alert(result.message);
                if (!result.status) {
                    alert(result.message);
                    return;
                }
                let split = (result.file).split("\\");
                split = split[split.length - 1].split(".");
                let origin_file = split[0] + "." + split[1];
                let tag =
                    '<div class="profile_mod_imgs"  filename="'+origin_file+'" style="background-image:url(/images/profile/'+origin_file+')">'+
                    '<button onclick=deleteImg("'+origin_file+'")>&times;</button>'+
                '</div>';
                $(".profile_img_mod_area").append(tag);
                $("#profile_img_mod_save").hide();
            }
        })
    })


    $("#phone_dup_chk").click(function(){
        if(isEmpty($("#mi_phone").val())) {
            alert("전화번호를 올바르게 입력해주세요.");
            return;
        }        

        if(!phone_check) {
            alert("전화번호 중복체크를 해주세요.");
            return;
        }

        $.ajax({
            url:"/api/member/phone_chk?phone_no="+$("#mi_phone").val(),
            type:"get",
            success:function(duplicate) {
                if(!duplicate) {
                    phone_check = true;
                    alert($("#mi_phone").val()+"은(는) 사용할 수 있습니다.")
                }
                else {
                    alert($("#mi_phone").val()+"은(는) 사용중인 전화번호 입니다.")
                }
            }
        })
    });

    $("#modify_btn").click(function(){      
        if(!confirm("정보를 수정하시겠습니까?")) return;
        
        if(isEmpty($("#mi_pwd").val())) {alert("비밀번호를 올바르게 입력해주세요."); return;}
        if(isEmpty($("#mi_phone").val())) {alert("전화번호를 올바르게 입력해주세요."); return;}
        if(isEmpty($("#mi_addr").val(), false)) {alert("주소를 올바르게 입력해주세요."); return;}

        if($("#mi_pwd").val() != $("#mi_pwd_confirm").val()) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return;
        }

        if(!phoneNumberValidate($("#mi_phone").val())) {
            alert("전화번호를 올바르게 입력해주세요.");
            return;
        }

        let agreeAlrim = 0;
        
        if($(".isAlrim").prop("checked")){
            agreeAlrim = 1;
        }

        let data = {
            "mi_seq":$(this).attr("data-seq"),
            "mi_pwd":$("#mi_pwd").val(),
            "mi_nickname":$("#mi_nickname").val(),
            "mi_gen":$("#mi_gen option:selected").val(),
            "mi_phone":$("#mi_phone").val(),
            "mi_addr":$("#mi_addr").val(),
            "mi_role":$("#mi_role option:selected").val(),
            "mi_profile_img":$(".profile_mod_imgs").attr("filename"),
            "mi_status":1,
            "mi_use":1,
            "mi_alim":agreeAlrim
        }

        $.ajax({
            url:"/api/member/modify",
            type: "patch",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(result) {
                console.log(data);
                alert(result.message)
                location.reload();
            },
            error:function(err) {
                alert(err.responseJSON.message);
            }
        })
        
    })
})