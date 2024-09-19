import { BannersRoot, Banners, ProductRoot, Product, ProductCategory } from '../model/dataModel'
import { httpAPI } from '../service/httpAPI'
import { productList } from '../component/productListComponent'

@Entry
@Component
struct Index {
  swiperController: SwiperController = new SwiperController()
  scroller: Scroller = new Scroller()
  @State bannersDate: BannersRoot | undefined = undefined
  @State bannersImages: Banners[] = []
  @State productPage: number = 1
  @State productDate: ProductRoot | undefined = undefined
  @State productList: Product[] = []

  //轮播图
  getBanner() {
    httpAPI.getBanners('/api/v1/banners').then(response => {
      this.bannersDate = response.toJSON() as BannersRoot
      this.bannersImages = this.bannersDate.data
    })
  }

  //商品列表
  getProduct() {
    httpAPI.getProducts(`/api/v1/products/?page=${this.productPage}&&per=${10}`).then(response => {
      this.productDate = response.toJSON() as ProductRoot
      this.productList.push(...this.productDate.data)
      this.productPage += 1
    })
  }

  aboutToAppear(): void {
    this.getBanner()
    this.getProduct()
  }

  build() {
    Scroll(this.scroller) {
      Column() {
        //轮播图
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
      this.getProduct()
      console.info('To the edge')
    })
  }
}