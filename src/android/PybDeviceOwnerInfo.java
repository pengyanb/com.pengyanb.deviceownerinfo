package org.apache.cordova.PybDeviceOwnerInfo;


import android.content.Context;
import android.database.Cursor;
import android.os.Bundle;
import android.provider.ContactsContract;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.PluginResult;

import org.json.JSONObject;
import org.json.JSONException;
import org.json.JSONArray;

public class PybDeviceOwnerInfo extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("getDeviceOwnerInfo")) {
            this.getDeviceOwnerInfo(callbackContext);
            return true;
        }
        return false;
    }
    private void getDeviceOwnerInfo(CallbackContext callbackContext)
    {
        try
        {
            Cursor c = this.cordova.getActivity().getContentResolver().query(ContactsContract.Profile.CONTENT_URI, null, null, null, null);
            c.moveToFirst();
        //Log.v("[DeviceName]", c.getString(c.getColumnIndex("display_name")));
            String ownerName = c.getString(c.getColumnIndex("display_name"));
            String deviceModel = android.os.Build.MODEL;
            c.close();
            JSONObject json = new JSONObject();
            json.put("ownerName", ownerName);
            json.put("deviceModel", deviceModel);
            json.put("deviceOs", "AND");
            callbackContext.sendPluginResult(new PluginResult(PluginResult.Status.OK, json));
        }
        catch(Exception e)
        {
            callbackContext.error("Error: unable to get device owner info");
        }
    }
}