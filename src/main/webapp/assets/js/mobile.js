$(document).ready(function() {
  window.onscroll = function() {
    var $msearch = $('.mobile-search');
    var _this = this;
    if($msearch) {
      scrollTop = document.documentElement.scrollTop || window.pageYOffset || document.body.scrollTop;
      if (scrollTop > 5 ) {
        $('.vi-mobile .am-header-default').fadeOut();
        $msearch.css({
          'position': 'fixed',
          'left': '0',
          'top': '0',
          'z-index':'1000',
          'width': '100%'
        });
      } else {
        $('.vi-mobile .am-header-default').show();
        $msearch.css({
          'position': 'static'
        });
      }
    }
  };
});
