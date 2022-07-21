$(function (){
    $("#login_btn").click(function(){
        let data = {
            mi_id:$("#user_id").val(),
            mi_pwd:$("#user_pwd").val()
        }
        $.ajax({
            url:"/api/member/login",
            type:"post",
            contentType:"application/json",
            data:JSON.stringify(data),
            success:function(r) {
                console.log(r);
                alert(r.message);
                if(r.status) {
                    location.href = "/"
                }
            }
        })
    })
})