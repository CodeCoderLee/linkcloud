function ajax(a) {
    var d, b = "";
    var c = new XMLHttpRequest;
    a.data || (a.data = {});
    c.open("GET", a.url);
    c.send(null);
    c.onreadystatechange = function () {
        if (4 === c.readyState) {
            200 === c.status ? a.success(c.responseText) : a.fail && a.fail(c.status);
        }
    }
}

function ajax2(a) {
    var d, b = "{";
    var c = new XMLHttpRequest;
    a.data || (a.data = {});

    for (d in a.data) {
        if (b == "{") {
            b += '"' + d + '":"' + a.data[d] + '"';
        }
        else {
            b += ',"' + d + '":"' + a.data[d] + '"';
        }

    }
    b += "}";
    c.open("POST", a.url);
    c.send(b);
    c.onreadystatechange = function () {
        if (4 === c.readyState) {
            200 === c.status ? a.success(c.responseText) : a.fail && a.fail(c.status);
        }
    }
}




////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                         video 封装对象                                                //////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
var me = null;
function VideoWrapper(program,video,cls){
    this.video = video;
    this.program = program;
    this.userId = userId;
    this.cls = cls;
    this.devid = devid;
    this.programId = program.id;
    this.ptype = program.stype;
    this.pname = program.pname;
    this.purl = program.purl;
    this.ptype_analysis = '';
    this.pname_analysis = '';
    this.interval = -1;
    this.playList= ['', program.purl];
    this.playListLen = this.playList.length;
    this.playIndex = 0;
    this.cur_url = '';
    this.pid = 0;
    this.stime = 0;
    this.ctime= 0;

    this.startFlag = true;

    this.playFlag = false;
    this.stop = false;

    this.onLoad();

}

VideoWrapper.prototype.setPlayFlag = function(value){
    this.playFlag = value;
}

VideoWrapper.prototype.getPlayFlag = function(){
    return  this.playFlag ;
}

VideoWrapper.prototype.onLoad = function(){
    var that = this;
    this.video.onloadedmetadata = function () {
        that.pid = that.getPid(that.cur_url);
        that.stime = that.getDateTime();
        that.ptype_analysis = that.ptype_analysis;
        that.pname_analysis = that.pname_analysis;

        me = that;
        that.interval = setInterval("doSubmitAnalysisV(me)",3000)
        console.log("onloadedmetadata--interval--" + that.interval,'class--',that.cls);
    };

    this.video.onended = function () {
        if(that.interval != -1) {
            clearInterval(that.interval);
            console.log("ended--interval--" + that.interval,'class--',that.cls);
        }
        that.play();
    };

    this.video.ontimeupdate = function(){
        var me = that;
        console.log("ontimeupdate",'class--',that.cls);
    }

    this.video.onplaying = function(){
        console.log("onplaying--",'class--',that.cls);
    }

    this.video.onpause = function(){
        console.log("onpause",'class--',that.cls);
    }
}


VideoWrapper.prototype.getPid = function(url){
    if(url == this.purl){
        this.ptype_analysis = this.ptype;
        this.pname_analysis = this.pname;
        return this.programId;
    }else{
        this.ptype_analysis = 'ad';
        this.pname_analysis = '';
        return this.getAdId(url);
    }
}

VideoWrapper.prototype.getDateTime = function(){
    // 获取当前时间戳(以s为单位)
    var timestamp = Date.parse(new Date());
    timestamp = timestamp / 1000;
    //当前时间戳为：1403149534
    //console.log("当前时间戳为：" + timestamp);
    return timestamp.toString();
}

//service/getad得到反馈会是{"url":"http://192.168.1.13/ad/6.mp4"}
VideoWrapper.prototype.getAdId = function(url){
    var sindex = url.indexOf("ad/");
    var eindex = url.indexOf(".mp4");
    var id = url.substring(sindex+3,eindex);
    return id;
}

VideoWrapper.prototype.play = function(e) {
    console.log('play','class--',this.cls,'---stop---',this.stop);
    if(!this.stop) {
        if (this.playIndex >= this.playListLen) {
            return;
        }
        this.cur_url = this.playList[this.playIndex];
        this.video.src = this.cur_url;
        this.video.load();
        this.video.play();
        this.playIndex++;
    }

}

//VideoWrapper.prototype.playNext=function() {
//    if(!this.stop) {
//        if (this.playIndex >= this.playListLen) {
//            return;
//        }
//        this.cur_url = this.playList[this.playIndex];
//        this.video.src = this.cur_url;
//        this.video.load();
//        this.video.play();
//        this.playIndex++;
//    }
//    console.log('playNext','class--',this.cls,'---stop---',this.stop);
//}



VideoWrapper.prototype.stopPlay = function(){
    this.video.pause();
    this.stop = true;
    if(this.interval != -1){
        clearInterval(this.interval);
    }
    console.log('stop play','class--',this.cls,'---stop---',this.stop);
}

VideoWrapper.prototype.rePlay = function(){
    if(!this.cur_url){
        this.cur_url = this.playList[this.playIndex];
        if(!this.cur_url){
            this.playIndex++;
            this.cur_url = this.playList[this.playIndex];
        }
        this.video.src = this.cur_url;
        this.video.load();
    }

    this.video.play();
    this.stop = false;
    this.pid = this.getPid(this.cur_url);
    this.stime = this.getDateTime();
    this.ptype_analysis = this.ptype_analysis;
    this.pname_analysis = this.pname_analysis;

    me = this;
    this.interval = setInterval("doSubmitAnalysisV(me)",3000)
}


VideoWrapper.prototype.startOrRePlay = function(oldObj){
    var preVideo = oldObj;
    var me = this;
    oldVideo = this;
    $(".am-header-title a").text(this.program.pname + "--" + this.cls);

    if(preVideo){
        preVideo.stopPlay();
    }
    console.log('me.cls',me.cls,'old.cls',preVideo!=null?preVideo.cls:"null");
    console.log('me.stop',me.stop,'old.stop',preVideo!=null?preVideo.stop:"null");
    if(this.startFlag){
        //第一次启动
        console.log('startOrRePlay','class--',this.cls,'start -- init');
        this.startFlag = false;
        ajax({
            url: ad_url,
            data: {},
            success: function (a) {
                var json_obj = JSON.parse(a);
                me.playList[0] = json_obj.url;
                //me.stop = false;
                //service/getad得到反馈会是{"url":"http://192.168.1.13/vod/6.MP4"}
                me.play();
            },
            fail: function (a) {
                me.playIndex++;
                //me.stop = false;
                me.play();
            }
        });
    }else{
        //后续继续播放
        console.log('startOrRePlay','class--',this.cls,'replay');
        me.rePlay();
     }

}

VideoWrapper.prototype.changeComment = function(){
    var videoId = $("input[name=programId]").attr("value");
    jQuery.ajax({
        url:commentMoreUrl,
        data:{'pageNum':1,'videoId':videoId},
        type:"POST",
        beforeSend:function()
        {
            $('#more').hide();
        },
        success:function(data)
        {
            var pageInfo = jQuery.parseJSON(data);
            var li0 = $('article:first');
            $('#comment-list').empty();
            $('#comment-list').append(li0);
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
            if(!pageInfo.hasNextPage) {
                $("#more").attr("style", "display:none;");
            }
        }
    })
}