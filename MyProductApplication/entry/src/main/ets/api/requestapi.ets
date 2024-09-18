import { http, httpRequest } from '../utils/tools'
import { SwiperData } from '../utils/module'

//图片处理
function HandleImage(ImgUrl: string) {
  if (ImgUrl) {
    if (ImgUrl.startsWith('http')) {
      return ImgUrl
    } else {
      return 'http://localhost:1337' + ImgUrl
    }
  } else {
    return 'http://localhost:1337' + ImgUrl
  }

}

//获取轮播图
function getSwiper() {
  return httpRequest(('/api/v1/banners')).then()
    // JSON.parse(r).data.map((item: SwiperData) => {
    //   return item
    // })
}

//商品
//获取商品列表
function getProduct() {
  return httpRequest('/api/v1/products').then()
}

export {
  getSwiper, getProduct
}