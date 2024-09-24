@Builder
export function ShopCartPageBuilder(name: string, param: Object) {
  ShopCartPage()
}

@Component
export struct ShopCartPage {
  @State message: string = '购物车';

  build() {
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
}