//轮播图数据模型
interface BannersRoot {
  code: number
  data: Banners[]
}

interface Banners {
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

//商品数据模型
interface ProductRoot {
  code: number
  total: number
  pages: number
  data: Product[]
}

interface Product {
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
  category: ProductCategory
}

//商品详情数据模型
interface ProductDetailRoot {
  code: number
  data: ProductDetail
}

interface ProductDetail {
  createdAt: number
  updatedAt: number
  id: number
  name: string
  coverImage: string
  desc: string
  content: string
  views: number
  price: number
  onSale: number
  amount: number
  category: ProductCategory
}

//商品类别数据模型
interface ProductCategoryRoot {
  code: number
  data: ProductCategory[]
}

interface ProductCategory {
  createdAt: number
  updatedAt: number
  id: number
  name: string
  coverImage: string
  desc: string
  parent: number
}

export {
  BannersRoot,
  Banners,
  ProductRoot,
  Product,
  ProductDetailRoot,
  ProductDetail,
  ProductCategoryRoot,
  ProductCategory
}