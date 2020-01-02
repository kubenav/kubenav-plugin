declare module "@capacitor/core" {
  interface PluginRegistry {
    KubenavPlugin: KubenavPluginPlugin;
  }
}

export interface KubenavPluginPlugin {
  request(options: { server: string, method: string, url: string, body: string, certificateAuthorityData: string, clientCertificateData: string, clientKeyData: string, token: string }): Promise<{data: string}>;
}
