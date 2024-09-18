import { getProduct, getSwiper } from '../api/requestapi'
import { IProductCategory, IProductData, IProductRoot } from '../utils/module'

@Entry
@Component
struct Index {
  @State productArr: IProductData[] = []

  aboutToAppear() {
    getSwiper().then((r) => {
      console.log(r)
    })
    
    getProduct().then((r) => {
      const productData: IProductRoot = JSON.parse(JSON.stringify(r))
      this.productArr = productData.data
      this.productArr.forEach(item => {
        console.log(item.name)
      })
      // console.log(JSON.stringify(this.productArr))
    })
  }

  build() {
    Column() {
      List() {

      }
    }
    .height('100%')
    .width('100%')
  }
}