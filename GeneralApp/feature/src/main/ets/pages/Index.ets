import { AddressExchangeView } from '../views/addressexchange'

@Entry
@Component
struct Index {
  build() {
    Column() {
      AddressExchangeView()
    }
    .height('100%')
    .width('100%')
  }
}