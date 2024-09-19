import { BannersRoot, Banners, ProductRoot, Product, ProductCategoryRoot, ProductCategory } from '../model/dataModel'
import { httpAPI } from '../service/httpAPI'
import { productList } from '../component/productListComponent'

@Component
export struct homePage {
  scroller: Scroller = new Scroller()
  //tabs索引
  @State currentIndex: number = 0
  //轮播图数据定义
  @State bannersDate: BannersRoot | undefined = undefined
  @State bannersImages: Banners[] = []
  //商品列表数据定义
  @State productPage: number = 1
  @State productDate: ProductRoot | undefined = undefined
  //商品详情数据定义
  @State productList: Product[] = []
  //商品类别数据定义
  @State productCategoryData: ProductCategoryRoot | undefined = undefined
  @State productCategoryMsg: ProductCategory[] = []

  //轮播图
  getBanner() {
    httpAPI.getBanners('/api/v1/banners').then(response => {
      this.bannersDate = response.toJSON() as BannersRoot
      this.bannersImages = this.bannersDate.data
    })
  }

  //商品分类
  getCategory() {
    httpAPI.getProductsCategory('/api/v1/product_categories').then(response => {
      this.productCategoryData = response.toJSON() as ProductCategoryRoot
      this.productCategoryMsg = this.productCategoryData.data
      console.log(this.productCategoryMsg[0].name)
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
    this.getCategory()
    this.getProduct()
  }

  build() {
    Column() {
      Scroll(this.scroller) {
        Column() {
          Text('小小商城')
            .width('100%')
            .height(45)
            .textAlign(TextAlign.Center)
            .lineHeight(30)
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Bold)
            .backgroundColor('#ff6d6d')
            .margin({
              bottom: 10
            })
          Search({ placeholder: '搜索商品' })
            .width('90%')
            .backgroundColor(Color.White)
            .onSubmit(() => {
              console.log('搜索成功')
            })
          //轮播图
          Swiper() {
            ForEach(this.bannersImages, (item: Banners) => {
              Image('http://192.168.14.56:1337' + item.coverImage)
                .width('100%')
                .height(200)
            }, (item: Banners) => item.id + '')
          }
          .width('90%')
          .margin({
            bottom: 10
          })
          .autoPlay(true)

          //商品类别展示
          Grid() {
            ForEach(this.productCategoryMsg, (item: ProductCategory) => {
              GridItem() {
                Column() {
                  Text(item.name)
                  Image(item.coverImage)
                  // .width(50)
                }
              }
            }, (item: ProductCategory) => item.id + '')
          }
          .width('90%')
          .margin({
            bottom: 10
          })
          .borderRadius(10)
          .columnsTemplate('1fr 1fr 1fr 1fr')
          .backgroundColor(Color.White)

          Row() {
          }
          .width('100%')
          .height(70)
          .backgroundImage($r('app.media.MiHaYoBackground0'))
          .backgroundImageSize({
            width: '100%',
            height: 70
          })

          //商品列表展示
          Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceEvenly }) {
            ForEach(this.productList, (item: Product) => {
              productList({ productArr: item })
            }, (item: Product) => item.id + '')
          }
          .width('100%')
          .backgroundImage($r('app.media.MiHaYoBackground'))
          .backgroundImageSize({
            width: '100%',
            height: '100%'
          })
          .borderRadius(10)
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
      })
    }
    .width('100%')
    .height('100%')
    .backgroundImage($r('app.media.MiHaYoBackground1'))
    .backgroundImageSize({
      width: '100%'
    })
    .backgroundColor('#fff')
  }
}