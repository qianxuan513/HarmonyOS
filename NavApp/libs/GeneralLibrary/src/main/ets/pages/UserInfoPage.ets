@Builder
export function UserInfoPageBuilder(name: string, param: Object) {
  UserInfoPage()
}

@Component
export struct UserInfoPage {
  @State message: string = '个人信息';

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.White)
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor('#ffdfe2e2')
  }
}
