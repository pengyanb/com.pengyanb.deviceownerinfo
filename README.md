# com.pengyanb.deviceownerinfo
Phonegap - Device Owner Info

Install: phonegap plugin add  https://github.com/pengyanb/com.pengyanb.deviceownerinfo.git

Useage:

window.PYB.deviceOwnerInfo.getDeviceOwnerInfo(function(data){
    console.log("[Device Owner Info] :"+JSON.stringify(data));
    console.log(data.ownerName);
    console.log(data.deviceModel);
    console.log(data.deviceOs);
});
