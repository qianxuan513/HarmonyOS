import { SymbolGlyphModifier } from '@kit.ArkUI'
//引入GeneralLibrary模块的数据模型

//引入GeneralLibrary模块的页面
import { UserInfoPage } from 'GeneralLibrary'

//引入ShopApplibrary模块的页面
import { ShopHomePage, ShopCartPage } from 'ShopAppLibrary'

//引入ForumHomePage模块的页面
import { ForumHomePage } from 'ForumAppLibrary'

@Entry
@Component
struct Index {
  //本项目使用Navigation导航组件进行整体布局和路由跳转
  pathStack: NavPathStack = new NavPathStack()
  @State tabsIndex: number = 0 //定义选项卡tab的索引
  tabsController: TabsController = new TabsController() //定义选项卡tab控制器，用于控制tab栏

  build() {
    Navigation(this.pathStack) {
      Tabs({ controller: this.tabsController }) {
        TabContent() {
          ShopHomePage({ pathStack: this.pathStack })
        }

        TabContent() {
          ShopCartPage()
        }

        TabContent() {
          ForumHomePage()
        }

        TabContent() {
          UserInfoPage()
        }
      }
      .scrollable(false)
      .barWidth(0)
      .animationDuration(0)
    }
    //Navigation的属性
    .backgroundColor(Color.Pink)
    .hideTitleBar(true) //隐藏标题栏和菜单栏
    .mode(NavigationMode.Auto) //设置页面的显示模式
    .toolbarConfiguration([
      {
        value: '首页',
        icon: $r('app.media.unactive_mhyHome'),
        activeIcon: $r('app.media.active_mhyHome'),
        status: this.tabsIndex == 0 ? ToolbarItemStatus.ACTIVE : ToolbarItemStatus.NORMAL,
        // activeSymbolIcon: new SymbolGlyphModifier($r('app.media.active_mhyHome')).fontColor(['#ff6d6d'])
        //   .renderingStrategy(SymbolRenderingStrategy.MULTIPLE_COLOR),
        action: () => {
          this.tabsController.changeIndex(0)
          this.tabsIndex = 0
        }
      },
      {
        value: '购物车',
        icon: $r('app.media.unactive_mhyCart'),
        activeIcon: $r('app.media.active_mhyCart'),
        status: this.tabsIndex == 1 ? ToolbarItemStatus.ACTIVE : ToolbarItemStatus.NORMAL,
        action: () => {
          this.tabsController.changeIndex(1)
          this.tabsIndex = 1
        }
      },
      {
        value: '论坛',
        icon: $r('app.media.unactive_mhyHome'),
        activeIcon: $r('app.media.active_mhyHome'),
        status: this.tabsIndex == 2 ? ToolbarItemStatus.ACTIVE : ToolbarItemStatus.NORMAL,
        action: () => {
          this.tabsController.changeIndex(2)
          this.tabsIndex = 2
        }
      },
      {
        value: '我的',
        icon: $r('app.media.unactive_mhyMyself'),
        activeIcon: $r('app.media.active_mhyMyself'),
        status: this.tabsIndex == 3 ? ToolbarItemStatus.ACTIVE : ToolbarItemStatus.NORMAL,
        action: () => {
          this.tabsController.changeIndex(3)
          this.tabsIndex = 3
        }
      }
    ], {
      backgroundColor: '#fff'
    })

    // .titleMode(NavigationTitleMode.Mini) //设置标题栏模式
  }
}