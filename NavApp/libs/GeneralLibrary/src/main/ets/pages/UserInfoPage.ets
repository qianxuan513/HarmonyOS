@Builder
export function UserInfoPageBuilder(name: string, param: Object) {
  UserInfoPage()
}

@Component
export struct UserInfoPage {
  @State message: string = '用户信息';

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
