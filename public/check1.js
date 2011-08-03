var counter = 1;

$(function() {
    enable_cb();
    $('input[type=checkbox]').click(enable_cb);
});

function enable_cb() {
    if (this.checked) {
        counter++;
    }
    else {
        counter--;
    }


    if (counter == 2) {
        $('input[type=checkbox]').attr("disabled", true);
        $('input[type=checkbox]').hide("slow");
        $("#abc").attr("disabled", false);


        $(":checked").each(function() {
            $('":checked"').show("slow")
            $(this).attr("disabled", false);
        });

    }

    if (counter < 2) {
        $('input[type=checkbox]').attr("disabled", false);
        $('input[type=checkbox]').show("slow");
        $("#abc").attr("disabled", true);
    }

}

$(document).ready(function() {
    var oldSize = parseFloat($("#content1").css('font-size'));
    var newSize = oldSize * 2;
    $("#content").hover(
        function() {
            $("#content").animate({ fontSize: newSize}, 200);
        },
        function() {
            $("#content").animate({ fontSize: oldSize}, 200);
        }
    );
});

