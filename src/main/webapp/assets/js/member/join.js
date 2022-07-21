let dup_check = false;
$(function(){
    $("#mi_birth").datepicker({
        dateFormat:"yy-mm-dd",
        monthNames:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        monthNamesShort:["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
        dayNames:["일","월","화","수","목","금","토"],
        dayNamesShort:["일","월","화","수","목","금","토"],
        dayNamesMin:["일","월","화","수","목","금","토"],
        yearSuffix:"년",
        showMonthAfterYear: true,
        changeYear:true,
        changeMonth:true,
    });

    $("#profile_img").change(function () {
        let form = $("#profile_img_form");
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
                    '<div class="profile_imgs"  filename="'+origin_file+'" style="background-image:url(/images/profile/'+origin_file+')">'+
                    '<button onclick=deleteImg("'+origin_file+'")>&times;</button>'+
                '</div>';
                $(".profile_img_area").append(tag);
                $("#profile_img_save").hide();
            }
        })
    })

    $("#mi_id").keyup(function(){
        dup_check = false;
    })
    $("#id_dup_chk").click(function(){
        if(isEmpty($("#mi_id").val())) {
            alert("아이디를 올바르게 입력해주세요.");
            return;
        }        

        $.ajax({
            url:"/api/member/id_chk?id="+$("#mi_id").val(),
            type:"get",
            success:function(duplicate) {
                if(!duplicate) {
                    dup_check = true;
                    alert($("#mi_id").val()+"은(는) 사용할 수 있습니다.")
                }
                else {
                    alert($("#mi_id").val()+"은(는) 사용중인 아이디 입니다.")
                }
            }
        })
    });
    
    $("#join").click(function(){      
        if(!dup_check) {
            alert("아이디 중복체크를 해주세요.");
            return;
        }

        if(!confirm("회원가입하시겠습니까?")) return;
        
        if(isEmpty($("#mi_id").val())) {alert("아이디를 올바르게 입력해주세요."); return;}
        if(isEmpty($("#mi_pwd").val())) {alert("비밀번호를 올바르게 입력해주세요."); return;}
        if(isEmpty($("#mi_name").val())) {alert("이름을 올바르게 입력해주세요."); return;}
        if(!dateValidate($("#mi_birth").val())) {alert("생년월일을 올바르게 입력해주세요."); return;}
        if(isEmpty($("#mi_phone").val())) {alert("전화번호를 올바르게 입력해주세요."); return;}
        if(isEmpty($("#mi_addr").val(), false)) {alert("주소를 올바르게 입력해주세요."); return;}

        if($("#mi_pwd").val() != $("#mi_pwd_confirm").val()) {
            alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return;
        }
        if(!nameValidate($("#mi_name").val())) {
            alert("이름을 올바르게 입력해주세요.");
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
        "mi_id":$("#mi_id").val(),
        "mi_pwd":$("#mi_pwd").val(),
        "mi_name":$("#mi_name").val(),
        "mi_nickname":$("#mi_nickname").val(),
        "mi_birth":$("#mi_birth").val()+"T00:00:00+09:00",
        "mi_gen":$("#mi_gen option:selected").val(),
        "mi_phone":$("#mi_phone").val(),
        "mi_addr":$("#mi_addr").val(),
        "mi_role":$("#mi_role option:selected").val(),
        "mi_profile_img":$(".profile_imgs").attr("filename"),
        "mi_status":1,
        "mi_use":1,
        "mi_alim":agreeAlrim
        }

        $.ajax({
            url:"/api/member/join",
            type: "put",
            data:JSON.stringify(data),
            contentType:"application/json",
            success:function(result) {
                alert(result.message)
                // history.back();
                location.href="/"
            },
            error:function(err) {
                alert(err.responseJSON.message);
            }
        })
    })
    function dateValidate(dt) {
        var regex = /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/g;
        return regex.test(dt);
    }

    function nameValidate(name) {
        let regex = /^[가-힝]{2,50}$/g;
        return regex.test(name);
    }
    function phoneNumberValidate(phone)     {
        let regex = /[0-9]{9,12}$/;
        return regex.test(phone);
    }
    function isEmpty(str, wscheck=true) {
        //아무것도 입력하지 않았는지 체크
        if(str == '')return true;
        
        // 공백만 입력되었는지 체크
        let whitespace=/^\s|\s+$/g;
        if(whitespace.test(str)) return true;
        if(str.replace(whitespace, '') == "") return true;
        if(str.match(/\s/g) && wscheck) return true;
        
        return false;
    }
})