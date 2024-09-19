import { router } from '@kit.ArkUI'
import { Product, ProductCategory } from '../model/dataModel'

@Entry
@Component
struct ProductDetailPage {
  @State productInfo: Product = router.getParams() as Product

  build() {
    Column() {
      Text('<  返回')
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .height(20)
        .onClick(() => {
          router.back()
        })
      Scroll() {
        Column() {
          Text(this.productInfo.id + '')
        }
      }
      .height('100%')
      .width('100%')
    }
  }
}