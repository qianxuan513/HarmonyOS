import { rcp } from '@kit.RemoteCommunicationKit';
import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { getMiHaYoProduct } from '../utils/mihayoAPI'

function getProductList(): Promise<string | Object | ArrayBuffer> {
  return new Promise((r, j) => {
    let httpRequest = http.createHttp();
    httpRequest.request(
      'https://api-mall.mihoyogift.com/common/homeishop/v1/goods/puzzle_goods_info?puzzle_id=mall_cn__1726133285&component_id=pz-eWUweyahLE',
      {
        method: http.RequestMethod.GET,
      },
      (err: BusinessError, data: http.HttpResponse) => {
        if (!err) {
          r(data.result)
        }
      })
  })
}

interface IData {
  goods_id: string
  name: string
  cover_url: string
  price: number
}

@Entry
@Component
export struct NavTest {
  @State productArr: Array<IData> = []
  @State currentIndex: number = 0

  @Builder
  MiHoYoTaberBuilder(title: string, normalImg: Resource, targetIndex: number) {
    Column() {
      Image(normalImg)
        .width(28)
        .margin({
          bottom: 4
        })
        .fillColor(this.currentIndex == targetIndex ? '#ff6d6d' : '#989b9e')
      Text(title)
        .fontSize(14)
        .fontColor(this.currentIndex == targetIndex ? '#ff6d6d' : '#989b9e')
    }
  }

  aboutToAppear() {
    getProductList().then(r => {
      let pObj = r + ''
      this.productArr = JSON.parse(pObj).data.list
      this.productArr.forEach(item => {
        console.log(item.name)
      })
    })

    getMiHaYoProduct()
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          Column() {
            Search()
              .backgroundColor(Color.White)
            List({ space: 10 }) {
              ForEach(this.productArr, (item: IData) => {
                ListItem() {
                  Column() {
                    Image(item.cover_url)
                      .borderRadius({
                        topLeft: 10,
                        topRight: 10
                      })
                    Text(item.name)
                      .textOverflow({
                        overflow: TextOverflow.Ellipsis
                      })
                      .maxLines(2)
                  }
                  .borderRadius(10)
                  .backgroundColor(Color.White)
                }
                .margin({
                  left: 5
                })
              })
            }
            .padding({
              bottom: 60
            })
            .lanes(2)
          }
          .width('100%')
          .height('100%')
          .padding({
            top: 10,
            left: 25,
            right: 25
          })
          .backgroundImage('https://act-webstatic.mihoyo.com/puzzle/mall/mall_cn__1726133285/resource/puzzle/upload/puzzle/2022/08/29/80e4b277264ce58cb306ace6b7ffdab6_3603576351374131433.png?x-oss-process=image/format,webp/quality,Q_90')
          .backgroundImageSize(ImageSize.Cover)
        }
        .tabBar(this.MiHoYoTaberBuilder('首页', $r('app.media.mihayo_home'), 0))

        TabContent() {
          Column() {
            Text('购物车')
              .width('100%')
              .height(40)
              .backgroundColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('100%')
        }
        .tabBar(this.MiHoYoTaberBuilder('购物车', $r('app.media.mihayo_cart'), 1))

        TabContent() {
          Column() {
            Text('个人中心')
              .width('100%')
              .height(40)
              .backgroundColor(Color.White)
              .textAlign(TextAlign.Center)
          }
          .width('100%')
          .height('100%')
        }
        .tabBar(this.MiHoYoTaberBuilder('我的', $r('app.media.myself'), 2))
      }
      .animationDuration(0)
      .barBackgroundColor(Color.White)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#e6e6e6')
  }
}