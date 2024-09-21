import { router } from '@kit.ArkUI'
import { HPRichText } from '@ohasasugar/hp-richtext';
import type { RichTextOption } from '@ohasasugar/hp-richtext';

import { Product, ProductDetailRoot, ProductDetail, ProductCategory } from 'GeneralModule'
import { httpAPI } from 'GeneralModule'

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

    Stack({ alignContent: Alignment.Bottom }) {
      Stack({ alignContent: Alignment.Top }) {
        Column() {
          Text('<  返回')
            .fontColor(Color.Black)
            .fontWeight(FontWeight.Bold)
            .backgroundColor(Color.White)
            .width('100%')
            .height(45)
            .onClick(() => {
              router.back()
            })
            .zIndex(999)

          Scroll() {

            Column() {
              Image(this.productInfo.coverImage)
                .width('100%')
                .zIndex(888)

              Column() {
                Column() {
                  Row() {
                    Text(this.productInfo.name)
                      .fontColor('#222324')
                      .fontSize(24)
                  }
                  .width('100%')
                  .height(50)
                  .padding({
                    left: 25,
                    right: 15
                  })

                  Text() {
                    Span(`￥`)
                      .fontColor('#222324')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(16)
                    Span(`${this.productInfo.price}`)
                      .fontColor('#222324')
                      .fontWeight(FontWeight.Bold)
                      .fontSize(22)
                    Span('起')
                      .fontColor('#222324')
                      .fontSize(16)
                  }
                  .width('100%')
                  .height(59)
                  .padding({
                    left: 15,
                    right: 15
                  })
                }
                .width('100%')
                .height(110)
                .backgroundImage($r('app.media.MiHaYoBackground2'))
                .backgroundImageSize({
                  width: '100%',
                  height: 110
                })

                Row() {
                  Text('优惠')
                    .height(16)
                    .fontColor('#989B9E')
                  Text('>')
                    .height(16)
                    .fontColor('#989B9E')
                }
                .width('100%')
                .height(44)
                .padding({
                  left: 15,
                  right: 15
                })
                .justifyContent(FlexAlign.SpaceBetween)
                .border({
                  width: {
                    bottom: 1
                  }
                })
                .borderColor('#f0f3f5')

                Row() {
                  Text('请选择商品款式')
                    .height(16)
                    .fontColor('#989B9E')
                  Text('>')
                    .height(16)
                    .fontColor('#989B9E')
                }
                .width('100%')
                .height(44)
                .padding({
                  left: 15,
                  right: 15
                })
                .justifyContent(FlexAlign.SpaceBetween)
              }
              .backgroundColor(Color.White)

              //商品详情
              Text('商品详情')
                .fontSize(20)
                .width('100%')
                .height(40)
                .fontWeight(FontWeight.Bold)
                .fontColor(Color.Black)
                .backgroundColor(Color.White)
                .margin({
                  top: 10
                })
                .padding({
                  left: 20
                })

              HPRichText({
                richTextOption: $richTextOption,
                needScroll: false,
                // onLinkPress: (e) => {
                //   return e;
                // }
              })
            }
            .width('100%')
            .zIndex(777)
            .padding({
              bottom: 90
            })
          }
          .height('100%')
        }
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
      .height(75)
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.White)
      .zIndex(888)
      .margin({
        bottom: -27
      })
    }
    .backgroundColor('#f0f3f5')
  }
}