import { InfoFeature } from 'GeneralModule'
import { preferencesStorage } from 'GeneralModule'

@Component
struct userOrder {
  @Prop img: Resource
  @Prop txt: string

  build() {
    Column() {
      Image(this.img)
        .width(32)
        .height(32)
      Text(this.txt)
    }
  }
}

@Component
export struct userInfo {
  @State userToken: string = ''
  @State featureList: InfoFeature[] = [
    {
      id: '1',
      text: '米游铺积分',
      image: $r('app.media.mihayo_jifen')
    },
    {
      id: '2',
      text: '我的关注',
      image: $r('app.media.mihayo_guanzhu')
    },
    {
      id: '3',
      text: '我的优惠券',
      image: $r('app.media.mihayo_quan')
    },
    {
      id: '4',
      text: '收货地址',
      image: $r('app.media.mihayo_adress')
    },
    {
      id: '5',
      text: '联系客服',
      image: $r('app.media.mihayo_kefu')
    },
    {
      id: '6',
      text: '查看《服务条款》',
      image: $r('app.media.mihayo_tiaokuan')
    },
  ]

  aboutToAppear(): void {
    this.userToken = preferencesStorage.getData('token')
    // console.log(this.userToken)
  }

  build() {
    Column() {
      Text('个人中心')
        .width('100%')
        .height(45)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.White)

      //用户信息展示
      Row() {
        Image($r('app.media.miyopuicon'))
          .width(72)
          .height(72)
          .borderRadius(36)
        Column() {
          Text('昵称')
            .margin({
              bottom: 10
            })
          Text('通行证 ID：122353456546')
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .height(104)
      .backgroundColor(Color.White)
      .margin({
        top: 1
      })

      //用户订单管理
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
            userOrder({ img: $r('app.media.mihayo_money'), txt: '待支付' })
          }

          GridItem() {
            userOrder({ img: $r('app.media.mihayo_fahuo'), txt: '待发货' })
          }

          GridItem() {
            userOrder({ img: $r('app.media.mihayo_shouhuo'), txt: '待收货' })
          }

          GridItem() {
            userOrder({ img: $r('app.media.mihayo_pingjia'), txt: '待评价' })
          }

          GridItem() {
            userOrder({ img: $r('app.media.mihayo_shouhou'), txt: '待售后' })
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

      //用户功能列表
      Column() {
        List() {
          ForEach(this.featureList, (item: InfoFeature) => {
            ListItem() {
              Row() {
                Row() {
                  Image(item.image)
                    .width(20)
                    .height(20)
                    .margin({
                      right: 5
                    })
                  Text(item.text)
                }

                Blank()
                Text('>')
              }
              .width('100%')
              .height(52)
            }
          }, (item: InfoFeature) => item.id)
        }
        .divider({ strokeWidth: 1, color: '#f0f3f5' })
        .padding({
          left: 16,
          right: 16
        })
      }
      .width('100%')
      .height(328)
      .backgroundColor(Color.White)
      .margin({
        bottom: 10
      })

      //退出登录
      Button('退出登录')
        .width('100%')
        .height(52)
        .backgroundColor(Color.White)
        .type(ButtonType.Normal)
        .fontColor(Color.Black)
        .onClick(() => {
          preferencesStorage.deleteData('token')
          preferencesStorage.flushData()
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f0f3f5')
  }
}