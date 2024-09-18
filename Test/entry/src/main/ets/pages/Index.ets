/*let daffodilsnum: number = 153;
let a = parseInt(`${daffodilsnum / 100}`) ;
let b = parseInt(`${daffodilsnum % 100 /10}`);
let c = daffodilsnum % 10;
let sum = a ** 3 + b ** 3 + c ** 3;
if (sum == daffodilsnum) {
  console.log(`${daffodilsnum}是水仙花数`);
} else {
  console.log(`${daffodilsnum}不是水仙花数`);
}*/

//九九乘法表
/*let str: string = '';
for (let i = 1; i <= 9; i++) {
  str = '';
  let j: number = 1
  for (j; j <= i; j++) {
    str += `${i} * ${j} = ${i * j}  `;
  }
  console.log(str);
}*/
 
@Entry
@Component
struct Index {
  @State message: string = '小说简介';
  @State tag1: string = '都市';
  @State flag: boolean = true;
  scroller: Scroller = new Scroller();

  build() {
    Scroll(this.scroller) {
      Column({ space: 10 }) {
        Row() {
          Image($r('app.media.ic_public_arrow_left'))
            .width(30)
            .height(30)
            .fillColor(Color.Black)
          Text(this.message)
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Center)
            .fontColor(Color.Black)
          Image($r('app.media.ic_gallery_photoedit_more'))
            .width(30)
            .height(30)
            .fillColor(Color.Black)
            .margin({
              right: 15
            })
        }
        .width('100%')
        .height(40)
        .backgroundColor('#fff')
        .justifyContent(FlexAlign.SpaceBetween)

        Row() {
          Text(this.tag1)
            .fontSize(18)
            .width(50)
            .height(30)
            .backgroundColor(Color.Brown)
            .textAlign(TextAlign.Center)
          Text('诡秘之主')
            .fontSize(18)
            .width(80)
            .height(30)
            .backgroundColor(Color.Yellow)
            .textAlign(TextAlign.Center)
          Text('1231231243333333')
            .width(100)
            .height(30)
            .backgroundColor(Color.Pink)
            .textOverflow({
              overflow: TextOverflow.Ellipsis
            })
            .maxLines(1)
        }
        .width('80%')
        .justifyContent(FlexAlign.Center)

        Image($r('app.media.ic_user_portrait'))
          .width(100)
          .height(100)
          .fillColor('#fff')
        TextInput({ placeholder: '输入用户名' })
          .backgroundColor('#fff')
          .margin({
            left: 15,
            right: 15
          })
        TextInput({ placeholder: '输入密码' })
          .type(InputType.Password)
          .backgroundColor('#fff')
          .margin({
            left: 15,
            right: 15
          })
        Button('登录')
          .width(200)
          .fontColor('black')
        if (this.flag) {
          Image($r('app.media.ic_public_list_add_light'))
            .width(20)
            .height(20)
            .onClick(() => {
              this.flag = false
            })
        } else {
          Image($r('app.media.ic_public_list_deleted'))
            .width(20)
            .height(20)
            .onClick(() => {
              this.flag = true
            })
        }

        Row() {
          //   背景图片
        }
        .width(300)
        .height(200)
        .backgroundColor(Color.Orange)
        .backgroundImage($r('app.media.8720'))
        .backgroundImageSize(ImageSize.Cover)

        Row() {
          Column() {
            Text('玩一玩')
              .fontWeight(FontWeight.Bold)
              .fontSize(24)
            Row() {
              Text('签到兑礼')
              Text('|')
              Text('超多大奖')
              Text('超好玩')
            }
            .width(210)
            .justifyContent(FlexAlign.SpaceAround)
          }
          .width(210)
          .height(80)
          .justifyContent(FlexAlign.SpaceEvenly)
          .alignItems(HorizontalAlign.Start)

          Image($r('app.media.startIcon'))
            .width(50)
            .height(50)
          Image($r('app.media.ic_public_arrow_right'))
            .width(30)
            .height(30)
        }
        .width('95%')
        .height(80)
        .backgroundColor("#fff")
        .justifyContent(FlexAlign.SpaceEvenly)
        .borderRadius(8)

        Row() {
          Column({ space: 10 }) {
            Image($r('app.media.bc'))
              .backgroundImageSize(ImageSize.Cover)
              .borderRadius(5)
            Text('今晚吃这个 | 每日艺术分享')
              .fontWeight(FontWeight.Bold)
              .margin({
                left: 10
              })
            Text('No.43')
              .margin({
                left: 10
              })
            Row() {
              Row() {
                Image($r('app.media.ic_user_portrait'))
                  .width(12)
                  .height(12)
                  .margin({
                    right: 5
                  })
                Text('插画师分享聚集地')
                  .fontSize(12)
              }
              .layoutWeight(1)

              Row() {
                Image($r('app.media.good'))
                  .width(12)
                  .height(12)
                Text('2300')
                  .fontSize(12)
              }
              .width(42)
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .width('100%')
            .padding({
              left: 10,
              right: 10
            })
          }
          .alignItems(HorizontalAlign.Start)
        }
        .borderRadius(5)
        .backgroundColor(Color.White)
        .width('60%')
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .backgroundColor('#ccc')
    }
    .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
    .scrollBar(BarState.On) // 滚动条常驻显示
    .scrollBarColor(Color.Gray) // 滚动条颜色
    .scrollBarWidth(3) // 滚动条宽度
    .edgeEffect(EdgeEffect.Spring) // 滚动到边沿后回弹
  }
}
