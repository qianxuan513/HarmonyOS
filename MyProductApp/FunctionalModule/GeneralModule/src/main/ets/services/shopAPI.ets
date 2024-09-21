import { BusinessError } from '@kit.BasicServicesKit';
import { dealImage, httpRequest } from '../toolsModule/tools'
import { Banners, Product, userInfoModel } from '../module/dataModel'

//rcp发起http网络请求
export class httpAPI {
  static getBanners(url: string): Promise<Banners[]> {
    return httpRequest.httpGet(url).then(res => {
      return (res!['data'] as Banners[]).map(item => {
        return {
          createdAt: item.createdAt,
          updatedAt: item.updatedAt,
          id: item.id,
          name: item.name,
          coverImage: dealImage(item.coverImage),
          desc: item.desc,
          link: item.link,
          url: item.url,
          category: item.category
        } as Banners
      })
    })
  }

  static getProducts(url: string): Promise<Product[]> {
    return httpRequest.httpGet(url).then(res => {
      return (res!['data'] as Product[])
    })
  }

  static getProductsCategory(url: string) {
    return httpRequest.httpGet(url).then()
  }

  static getProductsDetail(url: string) {
    return httpRequest.httpGet(url).then()
  }

  static getLogin(url: string, data: userInfoModel) {
    return httpRequest.httpPost(url, data).then()
  }
}