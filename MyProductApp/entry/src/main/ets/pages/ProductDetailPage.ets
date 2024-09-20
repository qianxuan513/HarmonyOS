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
      this.productDetailMsg = response as ProductDetailRoot
      this.productDetailData = this.productDetailMsg.data
      this.richTextOption = { content: this.productDetailData.content }
    })
  }

  aboutToAppear(): void {
    this.getProductDetail()
  }

  build() {
    Scroll() {
      Stack({ alignContent: Alignment.Top }) {
        Text('<  返回')
          .fontColor(Color.Black)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .height(20)
          .onClick(() => {
            router.back()
          })
          .zIndex(999)
        Stack({ alignContent: Alignment.Bottom }) {
          Column() {
            Image(this.productInfo.coverImage)
              .width('100%')
              .zIndex(888)

            //商品详情
            Column() {
              Text('商品详情')
                .fontSize(20)
                .width('100%')
                .height(40)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.Black)
                .padding({
                  left: 20
                })

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
            .width('100%')
            .zIndex(777)
            .margin({
              top: 20
            })
            .padding({
              bottom: 110
            })
          }

          Row() {
            Image($r('app.media.mihayo_xing'))
              .width(26)
            Image($r('app.media.mihayo_kefu'))
              .width(26)
            Image($r('app.media.mihayo_cart'))
              .width(26)
            Button('加入购物车')
              .backgroundColor('#fff0f0')
              .fontColor('#ff6d6d')
            Button('立即购买')
              .backgroundColor('#ff6d6d')
              .fontColor('#fff')
          }
          .width('100%')
          .height(80)
          .justifyContent(FlexAlign.SpaceEvenly)
          .backgroundColor(Color.White)
          .zIndex(888)
        }
      }
    }
    .width('100%')
    .height('100%')
  }
}