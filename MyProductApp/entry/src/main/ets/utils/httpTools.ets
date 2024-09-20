import { rcp } from '@kit.RemoteCommunicationKit';
import { BusinessError } from '@kit.BasicServicesKit';

//定义基地址
export const baseUrl: string = 'http://192.168.14.56:1337'

//处理图片
export function dealImage(url: string) {
  if (url) {
    if (url.startsWith('http')) {
      return url
    } else {
      return baseUrl + url
    }
  } else {
    return ''
  }
}

//使用rcp发起网络请求
export class httpRequest {
  static setSession() {
    const session = rcp.createSession({
      baseAddress: baseUrl,
    })

    return session
  }

  static httpGet(url: string) {
    return httpRequest.setSession().get(url).then(res => {
      return res.toJSON()
    })
  }

  static httpPost() {

  }
}