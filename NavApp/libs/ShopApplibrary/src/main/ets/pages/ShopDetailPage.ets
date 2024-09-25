@Builder
export function ShopDetailPageBuilder(name: string, param: Object) {
  ShopDetailPage()
}

@Component
export struct ShopDetailPage {
  pathStack: NavPathStack = new NavPathStack()
  @State message: string = '商品详情';

  build() {
    NavDestination() {
      Row() {
        Column() {
          Text(this.message)
            .fontSize(50)
            .fontWeight(FontWeight.Bold)
        }
        .width('100%')
      }
      .height('100%')
    }
    .onReady((context: NavDestinationContext) => {
      this.pathStack = context.pathStack
    })
  }
}