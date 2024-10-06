@Builder
export function LoginPageBuilder(name: string, param: Object) {
  LoginPage()
}

@Component
export struct LoginPage {
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