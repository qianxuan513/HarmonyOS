import { homePage } from '../component/homeComponent'
import { userInfo } from '../component/userIfonComponent'
import { unLogin } from '../component/unLoginComponent'

@Entry
@Component
struct Index {
  @State currentIndex: number = 0

  @Builder
  tabBuilder(title: string, targetIndex: number, normalImg: Resource) {
    Column() {
      Image(normalImg)
        .width(28)
        .margin({
          bottom: 4
        })
        .fillColor(this.currentIndex == targetIndex ? '#ff6d6d' : '#989b9e')
      Text(title)
        .fontSize(14)
        .fontColor(this.currentIndex == targetIndex ? '#ff6d6d' : '#989b9e')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Tabs({ barPosition: BarPosition.End }) {
      TabContent() {
        homePage()
      }
      .tabBar(this.tabBuilder('首页', 0, $r('app.media.mihayo_home')))

      TabContent() {
        Column() {
          unLogin({ txt: '购物车' })
        }
        .width('100%')
        .height('100%')
      }
      .tabBar(this.tabBuilder('购物车', 1, $r('app.media.mihayo_cart')))

      TabContent() {
        userInfo()
      }
      .tabBar(this.tabBuilder('我的', 2, $r('app.media.myself')))
    }
    .animationDuration(0)
    .barBackgroundColor(Color.White)
    .onChange((index: number) => {
      this.currentIndex = index
    })
  }
}