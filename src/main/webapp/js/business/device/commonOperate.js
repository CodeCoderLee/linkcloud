/**
 * Created by lifm on 16/7/17.
 */
function setAvailable(id, serialNumber) {
    if (window.confirm("确认入库?")) {
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
    // $("#myContainer").load(url + "?id=" + id + "&serialNumber=" + serialNumber);
    var pages = $('#pagination').bootstrapPaginator("getPages");
    var msgPageSize = $('#msgPageSize').val();
    var msgPageNumber = pages.current;
    var msgSerialNumber = $('#searchParam').val();
    var msgEntrance = $('#msgEntrance').val();
    var msgUrl = $('#msgUrl').val();

    $("#myContainer").load(url, {
        id: id,
        serialNumber: serialNumber,
        msgPageSize: msgPageSize,
        msgPageNumber: msgPageNumber,
        msgEntrance: msgEntrance,
        msgSerialNumber: msgSerialNumber,
        msgUrl: msgUrl

    });

}
// /space/device/" + item.serialNumber + ".shtml?type=debug&openId=" + $('#openId').val()
function goSpace(serialNumber) {
    setFormData();
    var form = document.getElementById("spaceForm");
    form.setAttribute("action", "/space/device/" + serialNumber + ".shtml");
    form.setAttribute("method", "post");
    form.submit();
}

function goDebugHeartBeatInfo(serialNumber) {
    setFormData();


    var form = document.getElementById("spaceForm");
    form.setAttribute("action", "/space/goDebugHeartBeatInfo/" + serialNumber + ".shtml");
    form.setAttribute("method", "post");
    form.submit();
}

function setFormData() {
    var pages = $('#pagination').bootstrapPaginator("getPages");
    if ($('#msgPageSize').val() == null || $('#msgPageSize').val() == "") {
        $('#msgPageSize').val(6);
    }
    $('#msgPageNumber').val(pages.current);
    $('#msgSerialNumber').val($('#searchParam').val());
}

function scanFrequency(serialNumber) {
    var pages = $('#pagination').bootstrapPaginator("getPages");
    var msgPageSize = $('#msgPageSize').val();
    var msgPageNumber = pages.current;
    var msgSerialNumber = $('#searchParam').val();
    var msgEntrance = $('#msgEntrance').val();
    var msgUrl = $('#msgUrl').val();
    var id = $('#resId').val();
    $('#content').load("device/scanFrequencyUI.shtml?serialNumber=" + serialNumber + "&id=" + id, {
        msgPageSize: msgPageSize,
        msgPageNumber: msgPageNumber,
        msgEntrance: msgEntrance,
        msgSerialNumber: msgSerialNumber,
        msgUrl: msgUrl
    });
}

function getDeviceUpdate(serialNumber) {
    var pages = $('#pagination').bootstrapPaginator("getPages");
    var msgPageSize = $('#msgPageSize').val();
    var msgPageNumber = pages.current;
    var msgSerialNumber = $('#searchParam').val();
    var msgEntrance = $('#msgEntrance').val();
    var msgUrl = $('#msgUrl').val();
    var id = $('#resId').val();

    var url = rootPath + '/deviceUpdate/addUI.shtml';
    $("#myContainer").load(url + "?id=" + id + "&serialNumbers=" + serialNumber, {
        msgPageSize: msgPageSize,
        msgPageNumber: msgPageNumber,
        msgEntrance: msgEntrance,
        msgSerialNumber: msgSerialNumber,
        msgUrl: msgUrl
    });

}

function shock(serialNumber) {
    $.ajax({
        method: 'get',
        url: 'device/shock.shtml',
        dataType: 'json',
        data: {serialNumber: serialNumber},
        success: function (data) {
            console.log(data);
            alert("指令已成功下发。");
        },
        error: function (XMLHttpRequest) {
            console.log(XMLHttpRequest);
        }
    });
}
