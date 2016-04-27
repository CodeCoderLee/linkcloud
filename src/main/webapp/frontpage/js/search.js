$(function() {
	$('.carousel').carousel({
		  interval: 4000
	});
	
	$('#searchtime0').daterangepicker({
	    "timePicker": true,
	    "timePicker24Hour": true,
	    "timePickerSeconds": true,
	    "startDate": "12/18/2015",
	    "endDate": "12/24/2015"
		}, function(start, end, label) {
		
		  console.log("New date range selected: " + start.format('YYYY-MM-DD hh:mm:ss') + " to " + end.format('YYYY-MM-DD hh:mm:ss') + " (predefined range: " + label + ")");
		  var startinput0 = $("input[id='starttime0']");
		  var endinput0 = $("input[id='endtime0']");
		  startinput0.val(start.format('YYYY-MM-DD hh:mm:ss'));
		  endinput0.val(end.format('YYYY-MM-DD hh:mm:ss'));
		  document.getElementById("mylabel0").style.display="none";
		  var value=$("#mytimelabel0").html(startinput0.val()+'~'+endinput0.val());
		});
	
	var totalCount = $("#msgcounts").val();
	var activepage = $("#activepage").val();
	//alert("activepage:::"+activepage);
	
	var showCount = 4;
	var limit = 20;
	$('#callBackPager').extendPagination({
        totalCount: totalCount,
        showPage: showCount,
        limit: limit,
        current:activepage,
        callback: function (curr) {
        	//alert("curr::"+curr);
        	doSub0(curr-1);
        }
    });
	
	
	
//	if(activepage>1){
//		
//		var pageObj = $(this).find('ul.pagination');
//		var activeObj = pageObj.find('li[class="active"]');
//        var activePage = Number(activeObj.find('a').html());
//		
//		activeObj.removeClass('active');
//		
//		var content=document.getElementById('callBackPager');
//		
//		var ul=content.childNodes.item(0);
//		alert("ul::"+ul);
//		alert("aaa:"+$("#callBackPager ul li:eq("+activepage+")"));
//		var apage = Number(activepage) + 1;
//		alert("apage::"+apage);
//		$("#callBackPager ul li:eq("+apage+")").addClass('active');
//	}
	
	
	
});

function doSub0(curr){
	var starttime1;
	var endtime1;
	var searchinput1;
	
	//alert("input[id='fromDateStr']:::"+$("input[id='fromDateStr']"));
	if( $("input[id='fromDateStr']")!=null){
		starttime1 = $("#fromDateStr").val();
	}
	if($("input[id='toDateStr']")!=null){
		endtime1 = $("#toDateStr").val();
	}
	if($("input[id='key']")!=null){
		searchinput1 = $("#key").val();
	} 
	
	var tb = $("#timelineul");
    tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/front/searchpage.shtml",
		{
        	"starttime":starttime1,
        	"endtime":endtime1,
        	"mypage":curr,
        	"mysize":"20",
        	"searchinput":searchinput1
        	
        }
	);
}


function goSub0(){
	var starttime = $("#starttime0").val();
	var endtime = $("#endtime0").val();
	var searchinput = $("#searchinput0").val();
	
	//alert('starttime::'+starttime);
//	alert('searchinput::'+searchinput);
	var tb = $("#loadhtml");
    //alert("loadhtml::::"+tb);
    tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/front/search.shtml",
		{
        	"starttime":starttime,
        	"endtime":endtime,
        	"mypage":0,
        	"mysize":"20",
        	"searchinput":searchinput
        	
        });
}

function doComSub0(){
	var starttime = $("#starttime0").val();
	var endtime = $("#endtime0").val();
	var imei = $("#imei").val();
	var imsi = $("#imsi").val();
	
	//alert("imei::"+imei);
	var tb = $("#loadhtml");
    //alert("loadhtml::::"+tb);
    tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/front/complexSearch.shtml",
		{
        	"starttime":starttime,
        	"endtime":endtime,
        	"mypage":"0",
        	"mysize":"20",
        	"imei":imei,
        	"imsi":imsi
        	
        });
}
function goPre(obj){
	//alert("obj:::"+obj);
	$('#carousel_'+obj).carousel('prev');
	//alert("wanbi");
	
}

function goNext(obj){
	//alert("obj:::"+obj);
	$('#carousel_'+obj).carousel('next');
	//alert("wanbi");
	
}

