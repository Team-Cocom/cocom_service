$(function(){
    $("#music_file_upload").change(function () {
        let form = $("#music_file_form");
        let formData = new FormData(form[0]);
        if ($(this).val() == '' || $(this).val() == null) return;

        $.ajax({
            url: "/music/upload/music",
            type: "put",
            data: formData,
            contentType: false,
            processData: false,
            success: function (result) {
                alert(result.message);
                if (!result.status) {
                    return;
                }

                let split = (result.file).split("\\");
                split = split[split.length - 1].split(".");
                let origin_file = split[0] + "." + split[1];
                let tag =
                    '<audio controls class="music_file" data-name="' + origin_file + '">' +
                    '<source src="/images/music/' + origin_file + '" type="audio/mp3">' +
                    '</audio>' +
                    '<button onclick=delete_music_file("' + origin_file + '")>&times;</button>';

                $(".music_file_area").append(tag);
                $(".music_upload_area").hide();
            }
        })
    })

    $("#music_img_upload").change(function () {
        let form = $("#music_img_form");
        let formData = new FormData(form[0]);
        if ($(this).val() == '' || $(this).val() == null) return;

        $.ajax({
            url: "/images/upload/music_cover",
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
                    '<div class="music_img" data-name="' + origin_file + '" style="background-image:url(/images/music_cover/'+origin_file+')">' +
                    '<button onclick=deleteImg("' + origin_file + '")>&times;</button>'
                '</div>';

                $(".music_img_area").append(tag);
                $("#music_img_save").hide();
            }
        })
    })

    $("#add_music").click(function () {
        if (!confirm("노래 정보를 추가하시겠습니까?")) return;

        let name = $("#mu_name").val();
        let img_file = $(".music_img").attr("data-name");
        let music_file = $(".music_file").attr("data-name");
        let mu_time = $("#mu_time").val();

        if($("#ai_seq").attr("data-seq") == null){
            $("#ai_seq").attr("data-seq") = 1;
        }

        if (isEmpty(name, false)) {
            alert("노래 제목을 올바르게 입력해 주세요.");
            return;
        }
        if (isEmpty(mu_time)) {
            alert("재생시간은 필수 항목입니다.");
            return;
        }


        let data = {
            mu_name: name,
            mu_ai_seq: $("#ai_seq").attr("data-seq"),
            mu_img_file: img_file,
            mu_ab_seq: 0,
            mu_music_file: music_file,
            mu_age: $("#mu_age option:selected").val(),
            mu_lyrics: $("#mu_lylic").val(),
            mu_explain_txt:$("#mu_explain_txt").val(),
            mu_playtime: mu_time,
            mu_gr_seq:$("#mu_gr_seq option:selected").val(),
            mu_cr_seq:$("#mu_cr_seq option:selected").val(),
            mu_is_confirm:1
        }

        $.ajax({
            url: "/api/music/add",
            type: "put",
            contentType: "application/json",
            data: JSON.stringify(data),
            success: function (r) {
                alert(r.message);
                location.reload();
            }
        })

    })
})

function delete_music_file(filename) {
    if (!confirm("노래 파일을 삭제 하시겠습니까?")) {
        return;
    }
    $.ajax({
        url: "/images/delete/music/"+filename,
        type: "delete",
        success: function (result) {
            alert(result.message);
            $(".music_file_area").html("");
            $("#music_file_upload_button").show();
        }
    })
}

function deleteImg(filename) {
    if (!confirm("커버 이미지를 삭제 하시겠습니까?")) {
        return;
    }
    $.ajax({
        url: "/images/delete/music_cover/" + filename,
        type: "delete",
        success: function (result) {
            alert(result.message);
            $(".music_img_area").html("");
            $("#music_img_save").show();
        }
    })
}