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
