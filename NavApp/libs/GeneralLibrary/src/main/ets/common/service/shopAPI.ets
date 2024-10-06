import { recRequest } from '../utils/tools'
import { CategoryData } from '../model/dataModel'
import { rcp } from '@kit.RemoteCommunicationKit'

//商品获取数据的rcp请求
export class shopRcpAPI {
  //获取商品分类数据
  static getProductsCategory(url: string, sessionConfig: rcp.SessionConfiguration): Promise<CategoryData> {
    return recRequest.rcpGet(url, sessionConfig).then(res => {
      return (res!['data'] as CategoryData)
    })
  }
}