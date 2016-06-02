$(document).ready(function () {
    $("#commentForm").submit(function () {
        jQuery.ajax({
            url:'comment.shtml',
            data:$('#commentForm').serialize(),
            type:"POST",
            beforeSend:function()
            {
                $('#commentFormBtn').hide();
                //CommnUtil.loadingImg();
            },
            success:function(data)
            {
                var comments = jQuery.parseJSON(data);
                $('#commentFormBtn').show();
                var li0 = $('article:first');
                $('#comment-list').empty();
                $('#comment-list').append(li0);
                for(var index in comments){
                    var idx = parseInt(index) + 1;
                    var comment = comments[index];
                    $('#comment-list').append(li0.clone());
                    $('article:eq(' + idx + ')').attr("style","display:block");
                    //$('article:eq(' + idx + ')').text(comment.user.accountname);
                    $('article:eq(' + idx + ') .am-comment-bd').text(comment.comment);
                }
            }
        });
        return false;
    });
})