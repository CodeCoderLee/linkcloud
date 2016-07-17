/**
 * Created by lifm on 16/7/17.
 */
function setAvailable(id, serialNumber) {
    if(window.confirm("确认入库?")){
        $.ajax({
            url: 'device/updateDevice.shtml',
            data: {id: id, status: 4, serialNumber: serialNumber},
            dataType: 'json',
            success: function () {
                notify('success', '     设备已入库      ');
                loadDevice(1, 6);
            },
            error: function (XMLHttpRequest) {
                console.log(XMLHttpRequest);
            }
        });
    }

}

function getHeartBeatInfo(id, serialNumber) {
    var url = 'device/getHeartBeatInfoPage.shtml';
    $("#myContainer").load(url + "?id=" + id + "&serialNumber=" + serialNumber);

}
