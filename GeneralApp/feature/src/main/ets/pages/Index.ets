import { AddressExchangeView } from '../views/addressexchange'
import { WaterFlowFeature } from '../views/waterflowFeature'

@Entry
@Component
struct Index {
  build() {
    Column() {
      // AddressExchangeView()
      WaterFlowFeature()
    }
    .height('100%')
    .width('100%')
  }
}