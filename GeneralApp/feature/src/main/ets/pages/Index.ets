import { AddressExchangeView } from '../views/addressexchange'

@Entry
@Component
struct Index {
  build() {
    RelativeContainer() {
      AddressExchangeView()
    }
    .height('100%')
    .width('100%')
  }
}