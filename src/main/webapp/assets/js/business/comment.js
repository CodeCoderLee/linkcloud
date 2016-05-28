$(document).ready(function () {
    //$("#commentFormBtn").click(function(){
    //    $('#commentForm').submit();
    //});

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
                var li0 = $('.am-comments-list li:first-child');
                $('.am-comments-list').empty();
                $('.am-comments-list').append(li0);
                for(var index in comments){
                    var idx = parseInt(index) + 1;
                    var comment = comments[index];
                    $('.am-comments-list').append(li0.clone());
                    $('.am-comments-list li:nth-child(' + idx + ')').attr("style","display:block");
                    $('.am-comments-list li:nth-child(' + idx + ') .am-comment-author').text(comment.user.accountname);
                    $('.am-comments-list li:nth-child(' + idx + ') .comment-text').text(comment.comment);
                }
            }
        });
        return false;
    });
})