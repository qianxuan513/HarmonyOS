@Builder
export function ForumHomePageBuilder(name: string, param: Object) {
  ForumHomePage()
}

@Component
export struct ForumHomePage {
  @State message: string = '论坛首页';

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