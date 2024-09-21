import { ShopHomePage } from 'ShopAppModule'

@Component
export struct userRegister {
  build() {
    Column() {
      ShopHomePage()
    }
    .width('100%')
    .height('100%')
  }
}