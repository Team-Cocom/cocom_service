$(function(){
<<<<<<< HEAD
    $(".add_playlist_btn").click(function(){
        alert();
    })
    $(".add_list_btn").click(function(){
        alert();
=======
    $(".mu_info").click(function(){
        $.ajax({
            url:"/api/palylist/add?seq="+$(this).attr("data-seq"),
            type:"put",
            success:function(r){
                alert(r.message);
                location.reload();
            }
        })
>>>>>>> service_work
    })
})