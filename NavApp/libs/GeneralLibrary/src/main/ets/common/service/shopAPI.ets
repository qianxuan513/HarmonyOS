import { recRequest } from '../utils/tools'
import { CategoryData } from '../model/dataModel'

//商品获取数据的rcp请求
export class shopRcpAPI {
  //获取商品分类数据
  static getProductsCategory(url: string): Promise<CategoryData> {
    return recRequest.rcpGet(url).then(res => {
      return (res!['data'] as CategoryData)
    })
  }
}