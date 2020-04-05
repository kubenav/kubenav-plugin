import Foundation
import Capacitor
import Request

/**
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitor.ionicframework.com/docs/plugins/ios
 */
@objc(KubenavPlugin)
public class KubenavPlugin: CAPPlugin {

    @objc func awsGetClusters(_ call: CAPPluginCall) {
        let accessKeyId = call.getString("accessKeyId") ?? ""
        let secretAccessKey = call.getString("secretAccessKey") ?? ""
        let region = call.getString("region") ?? ""
        
        var error: NSError?

        let data = RequestAWSGetClusters(accessKeyId, secretAccessKey, region, &error)

        if error != nil {
            call.reject(error?.localizedDescription ?? "")
            return
        }

        call.resolve([
            "data": data
        ])
    }
    
    @objc func awsGetToken(_ call: CAPPluginCall) {
        let accessKeyId = call.getString("accessKeyId") ?? ""
        let secretAccessKey = call.getString("secretAccessKey") ?? ""
        let region = call.getString("region") ?? ""
        let clusterID = call.getString("clusterID") ?? ""
        
        var error: NSError?

        let data = RequestAWSGetToken(accessKeyId, secretAccessKey, region, clusterID, &error)

        if error != nil {
            call.reject(error?.localizedDescription ?? "")
            return
        }

        call.resolve([
            "data": data
        ])
    }
    
    @objc func azureGetClusters(_ call: CAPPluginCall) {
        let subscriptionID = call.getString("subscriptionID") ?? ""
        let clientID = call.getString("clientID") ?? ""
        let clientSecret = call.getString("clientSecret") ?? ""
        let tenantID = call.getString("tenantID") ?? ""
        let resourceGroupName = call.getString("resourceGroupName") ?? ""
        let admin = call.getBool("admin") ?? false
        
        var error: NSError?

        let data = RequestAzureGetClusters(subscriptionID, clientID, clientSecret, tenantID, resourceGroupName, admin, &error)

        if error != nil {
            call.reject(error?.localizedDescription ?? "")
            return
        }

        call.resolve([
            "data": data
        ])
    }
    
    @objc func oidcGetLink(_ call: CAPPluginCall) {
        let discoveryURL = call.getString("discoveryURL") ?? ""
        let clientID = call.getString("clientID") ?? ""
        let clientSecret = call.getString("clientSecret") ?? ""
        let redirectURL = call.getString("redirectURL") ?? ""
        
        var error: NSError?

        let data = RequestOIDCGetLink(discoveryURL, clientID, clientSecret, redirectURL, &error)

        if error != nil {
            call.reject(error?.localizedDescription ?? "")
            return
        }

        call.resolve([
            "data": data
        ])
    }
    
    @objc func oidcGetRefreshToken(_ call: CAPPluginCall) {
        let discoveryURL = call.getString("discoveryURL") ?? ""
        let clientID = call.getString("clientID") ?? ""
        let clientSecret = call.getString("clientSecret") ?? ""
        let redirectURL = call.getString("redirectURL") ?? ""
        let code = call.getString("code") ?? ""
        
        var error: NSError?

        let data = RequestOIDCGetRefreshToken(discoveryURL, clientID, clientSecret, redirectURL, code, &error)

        if error != nil {
            call.reject(error?.localizedDescription ?? "")
            return
        }

        call.resolve([
            "data": data
        ])
    }
    
    @objc func oidcGetAccessToken(_ call: CAPPluginCall) {
        let discoveryURL = call.getString("discoveryURL") ?? ""
        let clientID = call.getString("clientID") ?? ""
        let clientSecret = call.getString("clientSecret") ?? ""
        let redirectURL = call.getString("redirectURL") ?? ""
        let refreshToken = call.getString("refreshToken") ?? ""
        
        var error: NSError?

        let data = RequestOIDCGetAccessToken(discoveryURL, clientID, clientSecret, redirectURL, refreshToken, &error)

        if error != nil {
            call.reject(error?.localizedDescription ?? "")
            return
        }

        call.resolve([
            "data": data
        ])
    }
    
    @objc func request(_ call: CAPPluginCall) {
        let method = call.getString("method") ?? ""
        let url = call.getString("url") ?? ""
        let body = call.getString("body") ?? ""
        let certificateAuthorityData = call.getString("certificateAuthorityData") ?? ""
        let clientCertificateData = call.getString("clientCertificateData") ?? ""
        let clientKeyData = call.getString("clientKeyData") ?? ""
        let token = call.getString("token") ?? ""
        let username = call.getString("username") ?? ""
        let password = call.getString("password") ?? ""

        var error: NSError?

        let data = RequestDo(method, url, body, certificateAuthorityData, clientCertificateData, clientKeyData, token, username, password, &error)

        if error != nil {
            call.reject(error?.localizedDescription ?? "")
            return
        }

        call.resolve([
            "data": data
        ])
    }

}
