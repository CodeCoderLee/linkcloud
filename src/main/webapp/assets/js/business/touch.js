$(document).ready(function () {

    video.addEventListener('touchstart', function(){
        console.log("touchstart");
    });

    video.addEventListener('touchmove', function(){
        var touch = event.targetTouches[0];
        video.style.left = touch.pageX + 'px';
        video.style.top = touch.pageY + 'px';
        console.log("touchmove");
    });

    video.addEventListener('touchend', function(){
        console.log("touchend");
    });

})