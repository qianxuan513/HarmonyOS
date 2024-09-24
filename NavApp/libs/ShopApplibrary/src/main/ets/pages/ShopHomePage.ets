@Builder
export function ShopHomePageBuilder(name: string, param: Object) {
  ShopHomePage()
}

@Component
export struct ShopHomePage {
  @State message: string = '商城首页';
  pathStack: NavPathStack = new NavPathStack()

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Button('去详情')
          .onClick(() => {
            this.pathStack.pushPathByName('ShopDetailPage', null)
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}