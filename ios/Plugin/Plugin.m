#import <Foundation/Foundation.h>
#import <Capacitor/Capacitor.h>

// Define the plugin using the CAP_PLUGIN Macro, and
// each method the plugin supports using the CAP_PLUGIN_METHOD macro.
CAP_PLUGIN(KubenavPlugin, "KubenavPlugin",
           CAP_PLUGIN_METHOD(awsGetClusters, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(awsGetToken, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(azureGetClusters, CAPPluginReturnPromise);
           CAP_PLUGIN_METHOD(request, CAPPluginReturnPromise);
)
