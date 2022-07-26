$(function(){
    $(".mu_info").click(function(){
        $.ajax({
            url:"/api/palylist/add?seq="+$(this).attr("data-seq"),
            type:"put",
            success:function(r){
                alert(r.message);
                location.reload();
            }
        })
    })
    $(".mu_like").click(function(){
        let mi_seq = $(this).attr("user-seq");
        let mu_seq = $(this).attr("data-seq");
        if(mi_seq == ''){
            alert("로그인 후 사용하실 수 있습니다");
            return;
        }
        $.ajax({
            url:"/api/music_like/?mu_seq="+mu_seq+"&mi_seq="+mi_seq,
            type:"put",
            success:function(r){
                if(!r.status){
                    alert(r.message)
                    return;
                }
                alert(r.message);
                location.reload();
            }
        })
    })
    $(".ab_like").click(function(){
        let mi_seq = $(this).attr("user-seq");
        let mu_seq = $(this).attr("data-seq");
        if(mi_seq == ''){
            alert("로그인 후 사용하실 수 있습니다");
            return;
        }
        $.ajax({
            url:"/api/album_like/?ab_seq="+mu_seq+"&mi_seq="+mi_seq,
            type:"put",
            success:function(r){
                if(!r.status){
                    alert(r.message)
                    return;
                }
                alert(r.message);
                location.reload();
            }
        })
    })
})