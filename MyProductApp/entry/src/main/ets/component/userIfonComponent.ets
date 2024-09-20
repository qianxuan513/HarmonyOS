@Component
struct userOrder {
  @Prop img: string
  @Prop txt: string

  build() {
    Column() {
      Image($r(this.img))
        .width(40)
        .height(40)
      Text(this.txt)
    }
  }
}

@Component
export struct userInfo {
  build() {
    Column() {
      Text('个人中心')
        .width('100%')
        .height(45)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.White)

      Row() {
        Image($r('app.media.miyopuicon'))
          .width(72)
          .height(72)
          .borderRadius(36)
        Column() {
          Text('昵称')
          Text('通行证 ID：122353456546')
        }
      }
      .width('100%')
      .height(104)
      .backgroundColor(Color.White)
      .margin({
        top: 1
      })

      Column() {
        Row() {
          Text('我的订单')
          Text('全部 >')
        }
        .width('100%')
        .height(22)
        .margin({
          bottom: 20
        })
        .justifyContent(FlexAlign.SpaceBetween)

        Grid() {
          GridItem() {
            userOrder({ img: 'app.media.miyopuicon', txt: '待支付' })
          }

          GridItem() {
            userOrder({ img: 'app.media.miyopuicon', txt: '待发货' })
          }

          GridItem() {
            userOrder({ img: 'app.media.miyopuicon', txt: '待发货' })
          }

          GridItem() {
            userOrder({ img: 'app.media.miyopuicon', txt: '待发货' })
          }

          GridItem() {
            userOrder({ img: 'app.media.miyopuicon', txt: '待发货' })
          }
        }
        .columnsTemplate('1fr 1fr 1fr 1fr 1fr')
      }
      .width('100%')
      .height(120)
      .backgroundColor(Color.White)
      .padding({
        top: 16,
        left: 16,
        right: 16,
      })
      .margin({
        top: 10,
        bottom: 10
      })

      Column() {

      }
      .width('100%')
      .height(320)
      .backgroundColor(Color.White)
      .margin({
        bottom: 10
      })

      Text('退出登录')
        .width('100%')
        .height(52)
        .backgroundColor(Color.White)
        .textAlign(TextAlign.Center)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f0f3f5')
  }
}