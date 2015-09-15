# com.pengyanb.deviceownerinfo
Phonegap "Device Owner Info" for gathering the Name of the Device specifiied by owner

window.PYB.deviceOwnerInfo.getDeviceOwnerInfo(function(data){
    console.log("[Device Owner Info] :"+JSON.stringify(data));
    console.log(data.ownerName);
    console.log(data.deviceModel);
    console.log(data.deviceOs);
});
