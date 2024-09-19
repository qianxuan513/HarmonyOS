import { router } from '@kit.ArkUI'
import { HPRichText } from '@ohasasugar/hp-richtext';
import type { RichTextOption } from '@ohasasugar/hp-richtext';

import { Product, ProductDetailRoot, ProductDetail, ProductCategory } from '../model/dataModel'
import { httpAPI } from '../service/httpAPI'

@Entry
@Component
struct ProductDetailPage {
  @State productInfo: Product = router.getParams() as Product
  @State productDetailMsg: ProductDetailRoot | undefined = undefined
  @State productDetailData: ProductDetail | undefined = undefined
  @State richTextOption: RichTextOption = { content: '' }

  //获取商品详情
  getProductDetail() {
    httpAPI.getProductsDetail(`/api/v1/products/${this.productInfo.id}`).then(response => {
      this.productDetailMsg = response.toJSON() as ProductDetailRoot
      this.productDetailData = this.productDetailMsg.data
      this.richTextOption = { content: this.productDetailData.content }
      console.log(this.productDetailData.name)
    })
  }

  aboutToAppear(): void {
    this.getProductDetail()
  }

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
          HPRichText({
            richTextOption: $richTextOption,
            needScroll: true,
            // onLinkPress: (e) => {
            //   return e;
            // }
          })
            .width('100%')
            .height('100%')
        }

        // RichText(this.productDetailData?.content)
        //   .width('100%')
      }
    }
  }
}