$(document).ready(function () {
    $(".am-comment-update").on("click", function () {
        //var $(this).parent().parent().next().children()[0];

    });

    $(".am-comment-delete").on("click", function () {
        $(this).parent().parent().next();

    });

    $("#more .more-comment").on("click",function(){
        //alert('pageNum------' + pageNum);
        jQuery.ajax({
            url:commentMoreUrl,
            data:{'pageNum':pageNum,'videoId':videoId},
            type:"POST",
            beforeSend:function()
            {
                $('#more').hide();
            },
            success:function(data)
            {
                var pageInfo = jQuery.parseJSON(data);
                $('#more').show();
                var li0 = $('article:first');
                for(var index in pageInfo.rows){
                    var idx = parseInt(index) + 1;
                    var comment = pageInfo.rows[index];
                    $('#comment-list').append(li0.clone());
                    $('article:last').attr("style","display:block");
                    //$('article:eq(' + idx + ')').text(comment.user.accountname);
                    $('article:last .am-comment-author').text(comment.accountname);
                    $('article:last .am-comment-time').text(comment.publishDateStr);
                    $('article:last .am-comment-bd').text("ID："+ comment.id  + ":::" + comment.comment);
                }
                pageNum = pageInfo.pageNum ;
                var h = $(document).height()-$(window).height();
                $(document).scrollTop(h);
                if(!pageInfo.hasNextPage) {
                    $("#more").attr("style", "display:none;");
                }
            }
        });
        return false;
    })

    $("#commentForm").submit(function () {
        jQuery.ajax({
            url:'../comment.shtml',
            data:$('#commentForm').serialize(),
            type:"POST",
            beforeSend:function()
            {
                $('#commentFormBtn').hide();
            },
            success:function(data)
            {
                var comments = jQuery.parseJSON(data);
                $('#commentFormBtn').show();
                var li0 = $('article:first');
                $('#comment-list').empty();
                $('#comment-list').append(li0);
                for(var index in comments.rows){
                    var idx = parseInt(index) + 1;
                    var comment = comments.rows[index];
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