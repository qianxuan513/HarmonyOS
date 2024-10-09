import { image } from '@kit.ImageKit';
import { fileDownload } from '../common/utils/tools'
import { common } from '@kit.AbilityKit';

@Builder
export function LoginPageBuilder(name: string, param: Object) {
  LoginPage()
}

@Component
export struct LoginPage {
  @State message: string = '用户信息';
  @State userImage: image.PixelMap | undefined = undefined

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Image(this.userImage)
          .width(100)
        Button()
          .onClick(() => {
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}