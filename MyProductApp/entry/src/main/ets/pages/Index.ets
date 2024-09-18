import { httpRequest } from '../utils/httpTools'
import { BannersRoot, Banners, ProductRoot, Product, ProductCategory } from '../model/dataModel'
import { httpAPI } from '../service/httpAPI'
import { productList } from '../component/productListComponent'

interface IPag {
  page?: number
  per?: number
  name?: string
  category?: string
}

@Entry
@Component
struct Index {
  swiperController: SwiperController = new SwiperController()
  scroller: Scroller = new Scroller()
  @State bannersDate: BannersRoot | undefined = undefined
  @State bannersImages: Banners[] = []
  @State productDate: ProductRoot | undefined = undefined
  @State productList: Product[] = []
  Content: IPag = {}

  getBanner() {
    httpAPI.getBanners('/api/v1/banners').then(response => {
      this.bannersDate = response.toJSON() as BannersRoot
      this.bannersImages = this.bannersDate.data
    })
  }

  getProduct() {
    httpAPI.getBanners('/api/v1/products').then(response => {
      this.productDate = response.toJSON() as ProductRoot
      this.productList.push(...this.productDate.data)
      // this.productList = this.productDate.data
    })
  }

  aboutToAppear(): void {
    this.getBanner()
    this.getProduct()
  }

  build() {
    Scroll(this.scroller) {
      Column() {
        Swiper() {
          ForEach(this.bannersImages, (item: Banners) => {
            Image('http://192.168.14.56:1337' + item.coverImage)
              .width('100%')
              .height(200)
          }, (item: Banners) => item.id + '')
        }
        .width('90%')
        .autoPlay(true)

        //商品列表展示
        Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceEvenly }) {
          ForEach(this.productList, (item: Product) => {
            productList({ productArr: item })
          }, (item: Product) => item.id + '')
        }
        .width('90%')
        .padding({
          left: 10,
          right: 10
        })
      }
    }
    .width('100%')
    .height('100%')
    .onScrollEdge((side: Edge) => {
      console.info('To the edge')
    })
  }
}