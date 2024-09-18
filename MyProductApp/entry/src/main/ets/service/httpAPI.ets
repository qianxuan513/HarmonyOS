import { BusinessError } from '@kit.BasicServicesKit';
import { httpRequest } from '../utils/httpTools'

//rcp发起http网络请求
export class httpAPI {
  static getBanners(url: string) {
    return httpRequest.httpGet(url).then()
  }

  static getProducts(url: string) {
    return httpRequest.httpGet(url).then()
  }
}