import { FirstCateData, Level1wordData, Level2wordData, shopRcpAPI, recRequest } from 'GeneralLibrary'

@Builder
export function ShopCategoryPageBuilder(name: string, param: Object) {
  ShopCategoryPage()
}

@Component
export struct ShopCategoryPage {
  pathStack: NavPathStack = new NavPathStack()
  @State listIndex: number = 2094
  @State categoryArr: FirstCateData[] = []
  @State categoryData: Level1wordData[] = []

  aboutToAppear(): void {
    shopRcpAPI.getProductsCategory('https://api.m.jd.com/api?functionId=mbf_queryCategory&appid=jd-cphdeveloper-m&body=%7B%22tenantCode%22%3A%22jgm%22%2C%22bizModelCode%22%3A%225%22%2C%22loginWQBiz%22%3A%22golden-trade%22%2C%22bizModeFramework%22%3A%22h5%22%2C%22bizModeClientType%22%3A%22M%22%2C%22uuid%22%3A%225867974187210700703%22%2C%22externalLoginType%22%3A%221%22%2C%22categoryId%22%3A%222094%22%7D&loginType=2')
      .then(res => {
        this.categoryArr = res.firstCate.filter(item => {
          return item.title != '热门推荐'
        })
        this.categoryData = res.secondCate.level1words.filter((item, index) => {
          return index != 0
        })
      })
  }

  build() {
    NavDestination() {
      Stack({ alignContent: Alignment.Top }) {
        Row() {
          Text('<')
            .margin({
              left: 10,
              right: 20
            })
          Search()
            .backgroundColor('#F7F7F7')
            .width(300)
            .height(30)
        }
        .width('100%')
        .height(40)

        //分类商品
        Row() {
          //侧边栏
          List() {
            ForEach(this.categoryArr, (item: FirstCateData) => {
              ListItem() {
                Text(item.title)
                  .width('100%')
                  .height(50)
                  .textAlign(TextAlign.Center)
                  .onClick(() => {
                    this.listIndex = Number(item.paneKey)
                    shopRcpAPI.getProductsCategory(`https://api.m.jd.com/api?functionId=mbf_queryCategory&appid=jd-cphdeveloper-m&body=%7B%22tenantCode%22%3A%22jgm%22%2C%22bizModelCode%22%3A%225%22%2C%22loginWQBiz%22%3A%22golden-trade%22%2C%22bizModeFramework%22%3A%22h5%22%2C%22bizModeClientType%22%3A%22M%22%2C%22uuid%22%3A%225867974187210700703%22%2C%22externalLoginType%22%3A%221%22%2C%22categoryId%22%3A%22${Number(item.paneKey)}%22%7D&loginType=2`)
                      .then(res => {
                        this.categoryData = res.secondCate.level1words.filter((item, index) => {
                          return index != 0
                        })
                      })
                  })
                  .backgroundColor(this.listIndex == Number(item.paneKey) ? '#fff' : '#fff8f8f8')
              }
              .height(50)
            }, (item: FirstCateData) => item.paneKey)
          }
          .width('20%')
          .height('100%')
          .scrollBar(BarState.Off)

          //商品内容
          Scroll() {
            List({ space: 20 }) {
              ForEach(this.categoryData, (item: Level1wordData) => {
                ListItem() {
                  Column() {
                    Text(item.secCateName)
                      .width('100%')
                      .height(40)
                      .lineHeight(40)
                      .fontSize(20)
                      .margin({
                        bottom: 10
                      })
                    Grid() {
                      ForEach(item.level2words, (lItem: Level2wordData) => {
                        GridItem() {
                          Column() {
                            Image(lItem.imageUrl)
                              .width(50)
                              .height(50)
                              .margin({
                                bottom: 4
                              })
                            Text(lItem.keyword)
                              .fontSize(14)
                              .fontWeight(FontWeight.Medium)
                          }
                          .width('100%')
                        }
                      })
                    }
                    .columnsTemplate('1fr 1fr 1fr')
                    .columnsGap(10)
                    .rowsGap(15)
                  }
                  .width('100%')
                  .alignItems(HorizontalAlign.Start)
                }
              })
            }
            .width('100%')
            .height('100%')
            .nestedScroll({
              scrollForward: NestedScrollMode.PARENT_FIRST,
              scrollBackward: NestedScrollMode.SELF_FIRST
            })
            .scrollBar(BarState.Off)
          }
          .width('80%')
          .height('100%')
        }
        .width('100%')
        .zIndex(999)
        .padding({
          top: 40
        })
      }
    }
    .hideTitleBar(true)
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}