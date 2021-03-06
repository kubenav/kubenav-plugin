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
    public void azureGetClusters(PluginCall call) {
        String subscriptionID = call.getString("subscriptionID");
        String clientID = call.getString("clientID");
        String clientSecret = call.getString("clientSecret");
        String tenantID = call.getString("tenantID");
        String resourceGroupName = call.getString("resourceGroupName");
        Boolean admin = call.getBoolean("admin");

        try {
            String data = Request.azureGetClusters(subscriptionID, clientID, clientSecret, tenantID, resourceGroupName, admin);
            JSObject res = new JSObject();
            res.put("data", data);
            call.resolve(res);
        } catch (Exception e) {
            call.reject(e.getLocalizedMessage());
        }
    }

    @PluginMethod()
    public void oidcGetLink(PluginCall call) {
        String discoveryURL = call.getString("discoveryURL");
        String clientID = call.getString("clientID");
        String clientSecret = call.getString("clientSecret");
        String redirectURL = call.getString("redirectURL");

        try {
            String data = Request.oidcGetLink(discoveryURL, clientID, clientSecret, redirectURL);
            JSObject res = new JSObject();
            res.put("data", data);
            call.resolve(res);
        } catch (Exception e) {
            call.reject(e.getLocalizedMessage());
        }
    }

    @PluginMethod()
    public void oidcGetRefreshToken(PluginCall call) {
        String discoveryURL = call.getString("discoveryURL");
        String clientID = call.getString("clientID");
        String clientSecret = call.getString("clientSecret");
        String redirectURL = call.getString("redirectURL");
        String code = call.getString("code");

        try {
            String data = Request.oidcGetRefreshToken(discoveryURL, clientID, clientSecret, redirectURL, code);
            JSObject res = new JSObject();
            res.put("data", data);
            call.resolve(res);
        } catch (Exception e) {
            call.reject(e.getLocalizedMessage());
        }
    }

    @PluginMethod()
    public void oidcGetAccessToken(PluginCall call) {
        String discoveryURL = call.getString("discoveryURL");
        String clientID = call.getString("clientID");
        String clientSecret = call.getString("clientSecret");
        String redirectURL = call.getString("redirectURL");
        String refreshToken = call.getString("refreshToken");

        try {
            String data = Request.oidcGetAccessToken(discoveryURL, clientID, clientSecret, redirectURL, refreshToken);
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
        Boolean insecureSkipTLSVerify = call.getBoolean("insecureSkipTLSVerify");
        Integer timeout = call.getInt("timeout");

        try {
            String data = Request.do_(method, url, body, certificateAuthorityData, clientCertificateData, clientKeyData, token, username, password, insecureSkipTLSVerify, timeout);
            JSObject res = new JSObject();
            res.put("data", data);
            call.resolve(res);
        } catch (Exception e) {
            call.reject(e.getLocalizedMessage());
        }
    }

}
