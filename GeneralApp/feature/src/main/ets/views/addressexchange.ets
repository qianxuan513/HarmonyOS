import { curves } from '@kit.ArkUI';

@Component
export struct AddressExchangeView {
  // 旋转角度
  @State rotateAngle: number = 0;
  // 偏移量
  @State translateX: number = 0;
  // 是否已交换
  @State swap: boolean = false;
  // 单次偏移距离
  private distance: number = 300 * 0.6;
  // 初始化偏移距离
  private zeroTranslate: number = 0;
  // 单次旋转180°
  private rotateAddAngle: number = 180;

  build() {
    Column({ space: 20 }) {
      Row() {
        Text('上海')
          .fontSize(22)
          .translate({ x: this.translateX })
          .width(80)
          .textAlign(this.swap ? TextAlign.End : TextAlign.Start)
        Stack() {
          Image($r('app.media.address_plane'))
            .width(20)
          Image($r('app.media.address_recycle'))
            .width(44)
            .rotate({ angle: this.rotateAngle })
            .animation({
              curve: Curve.EaseOut,
              playMode: PlayMode.Normal,
            })
        }
        .width(80)
        .onClick(() => {
          this.swap = !this.swap
          // TODO 知识点：动画效果，修改偏移量，修改旋转角度，实现效果
          animateTo({ curve: curves.springMotion() }, () => {
            if (this.swap) {
              this.translateX = this.distance;
            } else {
              this.translateX = this.zeroTranslate;
            }
          })
          this.rotateAngle += this.rotateAddAngle;
        })
        .backgroundColor(Color.Orange)

        Text('北京')
          .fontSize(22)
          .width(80)
          .translate({ x: -this.translateX })
          .textAlign(this.swap ? TextAlign.Start : TextAlign.End)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)

      Button($r('app.string.address_exchange_search_ticket'))

    }
    .width(300)
    .height(200)
    .borderRadius(20)
    .padding({
      top: 16
    })
    .backgroundColor(Color.Pink)
  }
}