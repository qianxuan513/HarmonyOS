@Entry
@Component
struct mtCart {
  @State num: number = 1
  @State price: number = 40.4
  @State inprice: number = this.price / 2
  @State total: number = (this.num * this.price * 10) / 10
  @State intotal: number = (this.num * this.inprice * 10) / 10

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      Row() {
        Image($r('app.media.bc'))
          .width(100)
          .height(100)
          .borderRadius(5)
          .margin({
            right: 10
          })

        Column() {
          Text('冲销量1000ml冰粉八果水果捞').fontSize(15)
          Text('含一份折扣商品')
            .fontSize(14)
            .fontColor('#7f7f7f')
            .margin({
              top: 10,
              bottom: 18
            })
          Row() {
            Text() {
              Span(`￥${(this.price / 2).toString()}`)
                .fontColor('#ff4000')
                .fontSize(15)
              Span(`￥${this.price.toString()}`)
                .fontColor('#7f7f7f')
                .fontSize(14)
                .decoration({ type: TextDecorationType.LineThrough })
            }

            Counter() {
              Text(this.num.toString())
            }.margin({ left: 20 })
            .onInc(() => {
              this.num++
              this.total = (this.num * this.price * 10) / 10
              this.intotal = (this.num * this.inprice * 10) / 10
            })
            .onDec(() => {
              if (this.num <= 1) {
                this.num = 1
              } else {
                this.num--
                this.total = (this.num * this.price * 10) / 10
                this.intotal = (this.num * this.inprice * 10) / 10
              }
            })
          }
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .height('100%')
      .padding(18)
      .backgroundColor('#cecece')

      Row() {
        Column() {
          Row() {
            Text() {
              Span(`已选${this.num.toString()}, `)
                .fontColor("#7f7f7f")
              Span(`合计：`)
              Span(`￥${this.intotal.toFixed(1)}`)
                .fontColor('#ff4000')
                .fontSize(18)
            }
          }

          Row() {
            Text() {
              Span(`共减￥${(this.total - this.intotal).toFixed(1)}`)
                .fontColor('#ff4000')
            }
          }
        }
        .alignItems(HorizontalAlign.End)

        Column() {

        }
      }.width('100%').height(80).backgroundColor(Color.White)
    }
  }
}