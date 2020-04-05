declare module "@capacitor/core" {
  interface PluginRegistry {
    KubenavPlugin: KubenavPluginPlugin;
  }
}

export interface KubenavPluginPlugin {
  awsGetClusters(options: { accessKeyId: string, secretAccessKey: string, region: string }): Promise<{data: string}>;
  awsGetToken(options: { accessKeyId: string, secretAccessKey: string, region: string, clusterID: string }): Promise<{data: string}>;
  azureGetClusters(options: { subscriptionID: string, clientID: string, clientSecret: string, tenantID: string, resourceGroupName: string, admin: boolean }): Promise<{data: string}>;
  oidcGetLink(options: { discoveryURL: string, clientID: string, clientSecret: string, redirectURL: string }): Promise<{data: string}>;
  oidcGetRefreshToken(options: { discoveryURL: string, clientID: string, clientSecret: string, redirectURL: string, code: string }): Promise<{data: string}>;
  oidcGetAccessToken(options: { discoveryURL: string, clientID: string, clientSecret: string, redirectURL: string, refreshToken: string }): Promise<{data: string}>;
  request(options: { server: string, cluster: string, method: string, url: string, body: string, certificateAuthorityData: string, clientCertificateData: string, clientKeyData: string, token: string, username: string, password: string }): Promise<{data: string}>;
}
