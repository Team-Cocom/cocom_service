var swit = true;
$(function(){
    $.ajax({
        url:"/api/member/user",
        type:"get",
        success:function(r){}
    })


    
    $(".music_inventory_button").click(function(){
        if(swit) {
            $(".music_inventory_area").removeClass("on"); 
            $(".music_inventory_area").hide(); 
        }
        else {
            $(".music_inventory_area").addClass("on");
            $(".music_inventory_area").show();  
        }
        swit = !swit;
    })

    $(".delete_music_playList").click(function(){
        if(!confirm("보관함에서 노래를 삭제하시겠습니까?"))return;

            $.ajax({
                url:"/api/playList/music/delete?seq="+$(this).attr("data-seq"),
                type:"delete",
                success:function(r){
                    location.reload();
                }
            })
    })


        $(".music_item").click(function(){
            now_playing = $(this).index();
            sessionStorage.setItem("music_index",now_playing);
            let img = $(this).find(".img").val();
            let music = $(this).find(".music").val();
            let music_name = $(this).find(".music_name_input").val();
            let artist = $(this).find(".artist_input").val();
            $(".play_music_name").html(music_name);
            $(".play_music_artist").html(artist);
            $(".play_music_img").css("background-image", "url('"+img+"')");
            $("#play_music").attr("src", music);
            document.getElementById('play_music').play();
            document.getElementById('play_music').currentTime = sessionStorage.getItem("time");
        })
        
        document.getElementById('play_music').ontimeupdate = function(){
            if(this.duration == this.currentTime) {
                if(now_playing == total-1) {
                    now_playing = 0;
                }
                else {
                    now_playing++;
                }
                $(".music_item").eq(now_playing).trigger('click');
                this.play();
            }
        }
        
        window.onbeforeunload = function () {
            let time = document.getElementById('play_music').currentTime;
            sessionStorage.setItem("time",time);
        }
        
        
            window.onload = function () {
                let index = sessionStorage.getItem("music_index");
                $(".music_item").eq(index).trigger('click');

            }
    })
    

