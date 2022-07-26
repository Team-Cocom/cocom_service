let checkedIndexs = null;
$(function(){
    $("#all_checkbox_check").click(function(){
        if($(this).prop("checked")){
            $(".music_check").prop("checked",true);
            checkedIndexs = new Array();
            for(let i=0; i<$(".music_check:checked").length; i++) {
                checkedIndexs.push(
                        Number($(".music_check:checked").eq(i).attr("data-seq"))
                    );
            }
        }
        else{
            $(".music_check").prop("checked",false);
        }
    })

    $("#delete_music").click(function(){
        if(!confirm("보관함에서 노래를 삭제하시겠습니까?"))return;

        let music_check_length = $(".music_check:checked").length;
        for(let i=0; i<music_check_length; i++){
            $.ajax({
                url:"/api/playList/music/delete?seq="+checkedIndexs[i],
                type:"delete",
                success:function(r){
                    location.reload();
                }
            })
        }
    })
    $(".music_check").click(function(){
        checkedIndexs = new Array();
        for(let i=0; i<$(".music_check:checked").length; i++) {
            checkedIndexs.push(
                    Number($(".music_check:checked").eq(i).attr("data-seq"))
                );
        }
    })
    
})