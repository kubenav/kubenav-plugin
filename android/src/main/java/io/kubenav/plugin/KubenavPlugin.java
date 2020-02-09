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
    public void awsGetClusters(PluginCall call) {
        String accessKeyId = call.getString("accessKeyId");
        String secretAccessKey = call.getString("secretAccessKey");
        String region = call.getString("region");

        try {
            String data = Request.awsGetClusters(accessKeyId, secretAccessKey, region);
            JSObject res = new JSObject();
            res.put("data", data);
            call.resolve(res);
        } catch (Exception e) {
            call.reject(e.getLocalizedMessage());
        }
    }

    @PluginMethod()
    public void awsGetToken(PluginCall call) {
        String accessKeyId = call.getString("accessKeyId");
        String secretAccessKey = call.getString("secretAccessKey");
        String region = call.getString("region");
        String clusterID = call.getString("clusterID");

        try {
            String data = Request.awsGetToken(accessKeyId, secretAccessKey, region, clusterID);
            JSObject res = new JSObject();
            res.put("data", data);
            call.resolve(res);
        } catch (Exception e) {
            call.reject(e.getLocalizedMessage());
        }
    }

    @PluginMethod()
    public void request(PluginCall call) {
        String method = call.getString("method");
        String url = call.getString("url");
        String body = call.getString("body");
        String certificateAuthorityData = call.getString("certificateAuthorityData");
        String clientCertificateData = call.getString("clientCertificateData");
        String clientKeyData = call.getString("clientKeyData");
        String token = call.getString("token");
        String username = call.getString("username");
        String password = call.getString("password");

        try {
            String data = Request.do_(method, url, body, certificateAuthorityData, clientCertificateData, clientKeyData, token, username, password);
            JSObject res = new JSObject();
            res.put("data", data);
            call.resolve(res);
        } catch (Exception e) {
            call.reject(e.getLocalizedMessage());
        }
    }

}
