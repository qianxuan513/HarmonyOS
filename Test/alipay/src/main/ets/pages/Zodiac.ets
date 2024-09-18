import { TipsDialog } from '@kit.ArkUI';
import { image } from '@kit.ImageKit';

interface Ishengxiao {
  name: string,
  imageurl: string,
  badgenum: number
}

@Entry
@Component
struct Zodiac {
  @State sindex: number = 0
  @State shnegxiaoarr: Array<Ishengxiao> = [
    {
      name: '鼠',
      imageurl: 'app.media.sx_mouse',
      badgenum: 0
    },
    {
      name: '牛',
      imageurl: 'app.media.sx_cow',
      badgenum: 0
    },
    {
      name: '虎',
      imageurl: 'app.media.sx_tiger',
      badgenum: 0
    },
    {
      name: '兔',
      imageurl: 'app.media.sx_rabbit',
      badgenum: 0
    },
    {
      name: '龙',
      imageurl: 'app.media.sx_dragon',
      badgenum: 0
    },
    {
      name: '蛇',
      imageurl: 'app.media.sx_snake',
      badgenum: 0
    },
    {
      name: '马',
      imageurl: 'app.media.sx_horse',
      badgenum: 0
    },
    {
      name: '羊',
      imageurl: 'app.media.sx_sheep',
      badgenum: 0
    },
    {
      name: '猴',
      imageurl: 'app.media.sx_monkey',
      badgenum: 0
    },
    {
      name: '鸡',
      imageurl: 'app.media.sx_chicken',
      badgenum: 0
    },
    {
      name: '狗',
      imageurl: 'app.media.sx_dog',
      badgenum: 0
    },
    {
      name: '猪',
      imageurl: 'app.media.sx_pig',
      badgenum: 0
    },
  ]
  @State num: number = 0
  //显示隐藏
  @State showOpacity: number = 0
  @State showZIndex: number = -1
  @State status: boolean = false
  //动画
  @State scaleX: number = 0
  @State scaleY: number = 0
  //弹窗
  dialogControllerImage: CustomDialogController = new CustomDialogController({
    builder: TipsDialog({
      imageRes: $r('app.media.dargen'),
      imageSize: {
        width: 300,
        height: 400
      },
      content: '召唤神龙'
    })
  })

  build() {
    Stack() {
      Column() {
        Grid() {
          ForEach(this.shnegxiaoarr, (item: Ishengxiao) => {
            GridItem() {
              Badge({
                count: item.badgenum,
                position: BadgePosition.RightTop,
                style: { badgeSize: 20, badgeColor: '#FA2A2D' }
              }) {
                Column() {
                  Image($r(item.imageurl))
                    .width('100%')

                  Text(item.name)
                }
              }
            }
            .width(80)
            .height(140)
          })
        }
        .rowsTemplate('1fr 1fr 1fr')
        .columnsTemplate('1fr 1fr 1fr 1fr')
        .width('100%')
        .height(500)

        Button('抽卡')
          .width(100)
          .margin({
            top: 10
          })
          .onClick(() => {
            this.showOpacity = 1
            this.showZIndex = 99
            this.scaleX = 1
            this.scaleY = 1
            this.sindex = Math.floor(Math.random() * 12)
            console.log(this.sindex.toString())
          })
      }
      .width('100%')
      .height('100%')

      Column({ space: 20 }) {
        Text(`获得生肖${this.shnegxiaoarr[this.sindex].name}`)
          .fontColor(Color.White)
          .fontSize(20)
        Image($r(this.shnegxiaoarr[this.sindex].imageurl))
          .width(200)
          .scale({
            x: this.scaleX,
            y: this.scaleY
          })
          .animation({
            duration: 800
          })
        Button('开心收下')
          .backgroundColor(Color.Transparent)
          .borderWidth(1)
          .borderColor(Color.White)
          .onClick(() => {
            this.shnegxiaoarr[this.sindex] = {
              name: this.shnegxiaoarr[this.sindex].name,
              imageurl: this.shnegxiaoarr[this.sindex].imageurl,
              badgenum: this.shnegxiaoarr[this.sindex].badgenum + 1
            }
            this.showOpacity = 0
            this.showZIndex = -1
            this.scaleX = 0
            this.scaleY = 0

            let flag = this.shnegxiaoarr.every((item) => {
              return item.badgenum > 0
            })

            this.status = flag
            if (flag) {
              // this.dialogControllerImage.open()
              setTimeout(() => {
                this.status = false
              }, 3000)
              console.log('召唤神龙')
            }
          })
      }
      .width('100%')
      .height('100%')
      .backgroundColor('#b3000000')
      .justifyContent(FlexAlign.Center)
      .opacity(this.showOpacity)
      .zIndex(this.showZIndex)
      .animation({
        duration: 800
      })

      if (this.status) {
        Column() {
          Image($r('app.media.dargen'))
            .width('100%')
            .height('100%')
            .onClick(() => {
              this.status = false
            })
        }

      }
    }
  }
}