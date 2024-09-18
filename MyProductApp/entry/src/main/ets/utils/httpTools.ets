import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';

//使用rcp发起网络请求
export  class httpRequest {
  static setSession() {
    const session = rcp.createSession({
      baseAddress: 'http://192.168.14.56:1337',
    })

    return session
  }

  static httpGet(url:string) {
    return httpRequest.setSession().get(url)
  }

  static httpPost() {

  }
}