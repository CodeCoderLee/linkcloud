<!DOCTYPE html>
<html>
<head>
    <meta charset=utf-8 />
    <title>videojs-contrib-hls embed</title>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/video.js/5.10.2/alt/video-js-cdn.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/video.js/5.10.2/video.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/videojs-contrib-hls/3.0.2/videojs-contrib-hls.js"></script>

</head>
<body>
<h1>Video.js Example Embed</h1>

<video id="my_video_1" class="video-js vjs-default-skin" controls preload="auto" width="640" height="268"
       data-setup='{}'>
    <%--<source src="http://solutions.brightcove.com/jwhisenant/hls/apple/bipbop/bipbopall.m3u8" type="application/x-mpegURL">--%>
        <source src="http://192.168.126.57/live/a_3002.m3u8" type="application/x-mpegURL">

</video>

<script>
</script>

</body>
</html>