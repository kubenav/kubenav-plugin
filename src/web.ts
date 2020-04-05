import { WebPlugin } from '@capacitor/core';
import { KubenavPluginPlugin } from './definitions';

export class KubenavPluginWeb extends WebPlugin implements KubenavPluginPlugin {
  constructor() {
    super({
      name: 'KubenavPlugin',
      platforms: ['web']
    });
  }

  async awsGetClusters(options: { accessKeyId: string, secretAccessKey: string, region: string }): Promise<{data: string}> {
    throw new Error(`This feature is not implemented for web, options: ${JSON.stringify(options)}`);
  };

  async awsGetToken(options: { accessKeyId: string, secretAccessKey: string, region: string, clusterID: string }): Promise<{data: string}> {
    throw new Error(`This feature is not implemented for web, options: ${JSON.stringify(options)}`);
  };

  async azureGetClusters(options: { subscriptionID: string, clientID: string, clientSecret: string, tenantID: string, resourceGroupName: string, admin: boolean }): Promise<{data: string}> {
    throw new Error(`This feature is not implemented for web, options: ${JSON.stringify(options)}`);
  };

  async oidcGetLink(options: { discoveryURL: string, clientID: string, clientSecret: string, redirectURL: string }): Promise<{data: string}> {
    throw new Error(`This feature is not implemented for web, options: ${JSON.stringify(options)}`);
  };

  async oidcGetRefreshToken(options: { discoveryURL: string, clientID: string, clientSecret: string, redirectURL: string, code: string }): Promise<{data: string}> {
    throw new Error(`This feature is not implemented for web, options: ${JSON.stringify(options)}`);
  };

  async oidcGetAccessToken(options: { discoveryURL: string, clientID: string, clientSecret: string, redirectURL: string; refreshToken: string }): Promise<{data: string}> {
    throw new Error(`This feature is not implemented for web, options: ${JSON.stringify(options)}`);
  };

  async request(options: { server: string, cluster: string, method: string, url: string, body: string, certificateAuthorityData: string, clientCertificateData: string, clientKeyData: string, token: string, username: string, password: string }): Promise<{data: string}> {
    let response = await fetch(`${options.server}/request`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
      body: JSON.stringify({
        cluster: options.cluster,
        method: options.method,
        url: options.url,
        body: options.body,
        certificateAuthorityData: options.certificateAuthorityData,
        clientCertificateData: options.clientCertificateData,
        clientKeyData: options.clientKeyData,
        token: options.token,
        username: options.username,
        password: options.password,
      }),
    });

    let json = await response.json();

    if (response.status >= 200 && response.status < 300) {
      return json
    }

    throw new Error(json.error);
  }
}

const KubenavPlugin = new KubenavPluginWeb();

export { KubenavPlugin };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(KubenavPlugin);
