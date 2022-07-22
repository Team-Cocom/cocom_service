$(function(){
    $(".pass_nomal_button").click(function(){
        let seq = $(this).attr("user-seq");
        let ps_seq = $(this).attr("data-seq");
        $.ajax({
            url:"/api/member/login",
            type:"get",
            success:function(r){
                if(r.user == null){
                    if(confirm("로그인 후 이용하실 수 있습니다\n로그인 페이지로 이동하시겠습니까?")){
                        location.href="/login"
                        return;
                    }
                }
                $.ajax({
                    url:"/api/pass/nomal/buy?seq="+seq+"&ps_seq="+ps_seq,
                    type:"put",
                    success:function(r){
                        if(!r.status){
                            alert(r.message); return;
                        }
                        alert(r.message);
                        location.reload();
                    }
                })
            }
        })
    })
})