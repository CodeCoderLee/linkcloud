$(function() {
	$('#searchtime').daterangepicker({
	    "timePicker": true,
	    "timePicker24Hour": true,
	    "timePickerSeconds": true,
	    "startDate": "12/18/2015",
	    "endDate": "12/24/2015"
		}, function(start, end, label) {
		  console.log("New date range selected: " + start.format('YYYY-MM-DD hh:mm:ss') + " to " + end.format('YYYY-MM-DD hh:mm:ss') + " (predefined range: " + label + ")");
		  //
		  var startinput = $("input[id='starttime']");
		  var endinput = $("input[id='endtime']");
		  startinput.val(start.format('YYYY-MM-DD hh:mm:ss'));
		  endinput.val(end.format('YYYY-MM-DD hh:mm:ss'));
		  document.getElementById("mylabel").style.display="none";
		  var value=$("#mytimelabel").html(startinput.val()+'~'+endinput.val());
		  console.log("New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')");
	});
	
	
	
});

function goSub(){
	var starttime = $("#starttime").val();
	var endtime = $("#endtime").val();
	
	var searchinput = $("#searchinput").val();
	//alert('starttime::'+starttime);
	var tb = $("#loadhtml");
    //alert("loadhtml::::"+tb);
    tb.html(CommnUtil.loadingImg());
	tb.load(rootPath+"/front/search.shtml",
		{
        	"starttime":starttime,
        	"endtime":endtime,
        	"mypage":"0",
        	"mysize":"20",
        	"searchinput":searchinput
        	
        });
}

function doComSub(){
	var starttime = $("#starttime").val();
	var endtime = $("#endtime").val();
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
