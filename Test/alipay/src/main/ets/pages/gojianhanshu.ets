class Temp {
  title: string = ''
}

@Builder
function CCont2() {
  Text('默认内容2')
}

@Component
struct MyCom {
  @Builder
  content() {
    Text('默认')
  }

  @BuilderParam diyContent: () => void = this.content
  title: string = ''
  extra: string = ''

  build() {
    Column() {
      Row() {
        Text(this.title)
        Text(this.extra)
      }
      .width('100%')
      .margin({
        bottom: 20
      })
      .justifyContent(FlexAlign.SpaceBetween)

      this.diyContent()
    }
    .width('90%')
    .height(180)
    .padding({
      top: 10,
      left: 10,
      right: 10
    })
    .borderRadius(20)
    .backgroundColor(Color.White)
  }
}

@Component
struct MyCard {
  @State label: string = 'hello'

  @Builder
  cTitle() {
    Text('默认')
  }

  @Builder
  CCont($$: Temp) {
    Text($$.title)
      .margin({
        right: 10
      })
    Button('切换')
      .margin({
        right: 10
      })
      .onClick(() => {
        this.label = '你好'
      })
  }

  @BuilderParam PcTitle: () => void = this.cTitle
  @BuilderParam PcCont: ($$: Temp) => void = this.CCont
  @BuilderParam PcCont2: () => void = CCont2

  build() {
    Column() {
      Row() {
        this.PcTitle()
      }
      .height(30)
      .width('100%')
      .borderRadius({
        topLeft: 20,
        topRight: 20
      })
      .padding({
        left: 10
      })
      .backgroundColor(Color.Pink)

      Row() {
        this.PcCont({ title: this.label })
        this.PcCont2()
      }
      .width('100%')
      .height(150)
      .padding({
        left: 10
      })
    }
    .width('90%')
    .height(180)
    .borderRadius(20)
    .backgroundColor(Color.White)
  }
}

@Entry
@Component
struct gojianhanshu {
  @Builder
  MTitle() {
    Text('这是一个标题')
  }

  @Builder
  MTitle2() {
    Text('这是另一个标题')
  }

  @Builder
  MCont() {
    Button('按钮一')
  }

  @Builder
  MCont2() {
    Button('按钮二')
  }

  build() {
    Column() {
      //尾随闭包的形式传递
      MyCom({
        title: '我的订单',
        extra: '全部订单 >'
      }) {
        Text('我是订单相关内容')
        Button('我是一个按钮')
      }

      MyCom({
        title: '小米有品重酬',
        extra: '7款重酬中 >'
      }) {
        Button('我是一个按钮')
      }

      //参数的形式传递
      MyCard({ PcTitle: this.MTitle, PcCont2: this.MCont })

      MyCard({ PcTitle: this.MTitle2, PcCont2: this.MCont2 })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .backgroundColor('#ffa5a5a5')
  }
}