import { sx } from '../components/sx'
import { http } from '@kit.NetworkKit';
import { BusinessError } from '@kit.BasicServicesKit';

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

interface IMiHaYoData {
  goods_id: string
  name: string
  cover_url: string
  market_price: number
  price: number
  tag: number
  sale_time: number
  is_sold_out: boolean
  remaining_time: number
  presale: boolean
  status: number
}

@Entry
@Component
struct Index {
  scroller: Scroller = new Scroller()
  @State currentIndex: number = 0
  @State productArr: Array<IMiHaYoData> = []

  @Builder
  zfbTaberBuilder(title: string, targetIndex: number, normalImg: Resource) {
    Column() {
      Image(normalImg)
        .fillColor(this.currentIndex === targetIndex ? '#5b73dc' : '#ffa5a5a5')
        .width(28)
        .margin({
          bottom: 4
        })
      Text(title)
        .fontSize(14)
        .fontColor(this.currentIndex === targetIndex ? '#5b73dc' : '#ffa5a5a5')
    }
    .width(30)
    .layoutWeight(1)
  }

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
  }

  build() {
    Stack({ alignContent: Alignment.Bottom }) {
      //底部导航栏
      Tabs({ barPosition: BarPosition.End }) {
        TabContent() {
          Stack({ alignContent: Alignment.Top }) {
            //顶部导航栏
            Row() {
              Column() {
                Text('北京').fontSize(18).fontColor('#fff')
                Text('晴 2°C').fontSize(12).fontColor('#fff')
                Image($r('app.media.zfb_top_arrow_down'))
                  .width(16)
                  .height(16)
                  .position({
                    x: 40
                  })
              }
              .margin({
                right: 30
              })

              Search({ placeholder: '搜索' })
                .searchButton('搜索')
                .width('70%')
                .height(30)
                .backgroundColor('#F5F5F5')
                .placeholderColor(Color.Grey)
                .placeholderFont({ size: 14, weight: 400 })
                .textFont({ size: 14, weight: 400 })
                .borderRadius(12)
                .margin({
                  right: 12
                })

              Image($r('app.media.zfb_top_add_norm'))
                .width(25)
                .height(25)
            }
            .width('100%')
            .height(60)
            .padding({
              left: 10,
              right: 10
            })
            .backgroundColor('#5b73dc')
            .zIndex(666)

            //主体内容
            Scroll(this.scroller) {
              Column() {
                //快捷按钮
                Row() {
                  Column() {
                    Image($r('app.media.zfb_bnt_sao'))
                      .width(36)
                    Text('扫一扫')
                      .fontColor('#fff')
                  }
                  .layoutWeight(1)

                  Column() {
                    Image($r('app.media.zfb_btn_pay'))
                      .width(36)
                    Text('收付款')
                      .fontColor('#fff')
                  }
                  .layoutWeight(1)

                  Column() {
                    Image($r('app.media.zfb_btn_go'))
                      .width(36)
                    Text('出行')
                      .fontColor('#fff')
                  }
                  .layoutWeight(1)

                  Column() {
                    Image($r('app.media.zfb_btn_card'))
                      .width(36)
                    Text('卡包')
                      .fontColor('#fff')
                  }
                  .layoutWeight(1)
                }
                .width('100%')
                .margin({
                  bottom: 15
                })
                .backgroundColor('#5b73dc')

                //展示内容
                Column() {
                  Flex({ wrap: FlexWrap.Wrap }) {
                    Column() {
                      Image($r('app.media.zfb_cnt_didi'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('滴滴出行')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_lift_pay'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('生活缴费')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_gp'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('股票')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_ml'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('蚂蚁森林')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_phone'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('手机充值')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_yeb'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('余额宝')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_hb'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('花呗')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_fz'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('飞猪旅行')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_tpp'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('淘票票')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_elm'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('饿了么')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_book'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('读书听书')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_ji'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('基金')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_zb'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('直播广场')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_yljk'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('医疗健康')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })

                    Column() {
                      Image($r('app.media.zfb_cnt_more'))
                        .width(28)
                        .margin({
                          bottom: 8
                        })
                      Text('更多')
                        .fontSize(12)
                        .fontColor('#666')
                    }
                    .width('20%')
                    .margin({ bottom: 10 })
                  }
                  .width('100%')
                }
                .width('100%')
                .height(700)
                .padding({ top: 10 })
                .backgroundColor('#f6f6f6')
                .borderRadius({ topLeft: 10, topRight: 10 })
              }
              .width('100%')
              .padding({ top: 60, bottom: 40 })
            }
          }
          .width('100%')
          // .height('100%')
          .backgroundColor('#5b73dc')
        }
        .tabBar(this.zfbTaberBuilder('首页', 0, $r('app.media.zfb_tab_home')))

        TabContent() {
          Column() {
            Text('理财').fontSize(30)
            List({ space: 10 }) {
              ForEach(this.productArr, (item: IMiHaYoData) => {
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
              }, (item: IMiHaYoData) => item.goods_id)
            }
            .padding({
              bottom: 60
            })
            .lanes(2)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#f6f6f6')
        }
        .tabBar(this.zfbTaberBuilder('理财', 1, $r('app.media.zfb_tab_licai')))

        TabContent() {
          Column() {
            sx()
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#f6f6f6')
        }
        .tabBar(this.zfbTaberBuilder('生活', 2, $r('app.media.zfb_tab_life')))

        TabContent() {
          Column() {
            Text('消息').fontSize(30)
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#f6f6f6')
        }
        .tabBar(this.zfbTaberBuilder('消息', 3, $r('app.media.zfb_tab_msg')))

        TabContent() {
          Column() {
            Text('我的').fontSize(30)
              .margin({
                bottom: 15
              })
            Navigator({
              target: 'pages/pPeople/People'
            }) {
              Row() {
                Text('通讯录')
                  .fontSize(20)
                  .lineHeight(30)
                Blank()
                Text('>')
                  .fontSize(20)
              }
              .width('100%')
              .height(50)
              .backgroundColor(Color.White)
              .padding({
                left: 15,
                right: 15
              })
            }
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#f6f6f6')
        }
        .tabBar(this.zfbTaberBuilder('我的', 4, $r('app.media.zfb_tab_life')))
      }
      .animationDuration(0)
      .onChange((index: number) => {
        this.currentIndex = index
      })
    }
    .width('100%')
    .height('100%')
  }
}