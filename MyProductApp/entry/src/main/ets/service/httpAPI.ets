import { BusinessError } from '@kit.BasicServicesKit';
import { httpRequest } from '../utils/httpTools'
import { BannersRoot, Banners } from '../model/dataModel'

//rcp发起http网络请求
export class httpAPI {
  static getBanners(url: string) {
    return httpRequest.httpGet(url).then()
  }
}