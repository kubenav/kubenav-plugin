package io.kubenav.plugin;

import com.getcapacitor.JSObject;
import com.getcapacitor.NativePlugin;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;

import request.Request;

@NativePlugin()
public class KubenavPlugin extends Plugin {

    @PluginMethod()
    public void request(PluginCall call) {
        String method = call.getString("method");
        String url = call.getString("url");
        String body = call.getString("body");
        String certificateAuthorityData = call.getString("certificateAuthorityData");
        String clientCertificateData = call.getString("clientCertificateData");
        String clientKeyData = call.getString("clientKeyData");
        String token = call.getString("token");

        try {
            String data = Request.do_(method, url, body, certificateAuthorityData, clientCertificateData, clientKeyData, token);
            JSObject res = new JSObject();
            res.put("data", data);
            call.resolve(res);
        } catch (Exception e) {
            call.reject(e.getLocalizedMessage());
        }
    }
}
