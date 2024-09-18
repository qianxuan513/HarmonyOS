import { httpRequest } from '../utils/httpTools'
import { BannersRoot, Banners } from '../model/dataModel'
import { httpAPI } from '../service/httpAPI'

@Entry
@Component
struct Index {
  swiperController: SwiperController = new SwiperController()
  @State bannersDate: BannersRoot | undefined = undefined
  @State bannersImages: Banners[] = []

  getBanner() {
    httpAPI.getBanners('/api/v1/banners').then(response => {
      this.bannersDate = response.toJSON() as BannersRoot
      this.bannersImages = this.bannersDate.data
      console.log(JSON.stringify(response.toJSON()))
      this.bannersImages.forEach(item => {
        console.log(item.name)
      })
    })
  }

  aboutToAppear(): void {
    this.getBanner()
  }

  build() {
    Column() {
      Scroll() {
        Swiper() {
          ForEach(this.bannersImages, (item: Banners) => {
            Image('http://192.168.14.56:1337' + item.coverImage)
              .width('100%')
              .height(200)
          }, (item: Banners) => item.id + '')
        }
        .autoPlay(true)
      }
      .width('100%')
      .height('100%')
    }
    .width('100%')
  }
}