var swit = true;
$(function(){
    $(".music_inventory_button").click(function(){
        if(swit) {
            $(".music_inventory_area").removeClass("on"); 
        }
        else {
            $(".music_inventory_area").addClass("on"); 
        }
        swit = !swit;
    })
    
})

