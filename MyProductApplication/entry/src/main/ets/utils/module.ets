//商品数据接口
interface IProductCategory {
  createdAt: number
  updatedAt: number
  id: number
  name: string
  coverImage: string
  desc: string
  parent: number
}

interface IProductData {
  createdAt: number
  updatedAt: number
  id: number
  name: string
  coverImage: string
  desc: string
  views: number
  price: number
  onSale: number
  amount: number
  category: IProductCategory
}

interface IProductRoot {
  code: number
  total: number
  pages: number
  data: IProductData[]
}

//轮播图接口
interface SwiperData {
  createdAt: number
  updatedAt: number
  id: number
  name: string
  coverImage: string
  desc: string
  link: string
  url: string
  category: number
}

export {
  IProductCategory, IProductData, IProductRoot, SwiperData
}