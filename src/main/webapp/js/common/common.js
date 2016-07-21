/**
 * Created by bcc on 16/5/19.
 */

(function ($) {
})(jQuery);

// $(document).ready(function () {
    // $('.btn').mousedown(function(){
    //     $(this).removeClass('btn-success');
    //     $(this).addClass('btn-warning');
    // });
    //
    // $('.btn').mouseup(function(){
    //     $(this).removeClass('btn-warning');
    //     $(this).addClass('btn-success');
    // });
// });

/**/
function onLoadUrl() {
    $("[data-url]").each(function () {
        var tb = $(this);
        tb.html(loadingHtml);
        tb.load(rootPath + tb.attr("data-url"));
    });
}

/*加载中的html*/
function loadingHtml() {
    return '<div class="alert alert-info">'
        + '<button type="button" class="close" data-dismiss="alert">'
        + '<i class="ace-icon fa fa-times"></i></button><div style="text-align:center">'
        + '<img src="' + rootPath + '/images/loading.gif"/><div>'
        + '</div>';
}


/*展示通知,type:inverse/info/success/warning/danger message:通知内容*/
function notify(type, message) {
    $.growl({
        icon: '',
        title: '',
        message: message,
        url: ''
    }, {
        element: 'body',
        type: type,
        allow_dismiss: true,
        placement: {
            from: 'top',
            align: 'center'
        },
        offset: {
            x: 20,
            y: 85
        },
        spacing: 10,
        z_index: 1031,
        delay: 2500,
        timer: 1000,
        url_target: '_blank',
        mouse_over: false,
        animate: {
            enter: 'animated fadeInDown',
            exit: 'animated fadeOutDown'
        },
        icon_type: 'class',
        template: '<div data-growl="container" class="alert" role="alert">' +
        '<button type="button" class="close" data-growl="dismiss">' +
        '<span aria-hidden="true">&times;</span>' +
        '<span class="sr-only">Close</span>' +
        '</button>' +
        '<span data-growl="icon"></span>' +
        '<span data-growl="title"></span>' +
        '<span data-growl="message"></span>' +
        '<a href="#" data-growl="url"></a>' +
        '</div>'
    });
}
