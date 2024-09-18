@Entry
@Component

struct jdLogin {
  @State message: string = '小说简介';
  build() {
    Column() {
      //顶部栏
      Row(){
        Image($r('app.media.ic_public_cancel'))
          .width(16)
          .height(16)
        Text('帮助')
      }
      .width('100%')
      .padding({
        top: 10,
      })
      .justifyContent(FlexAlign.SpaceBetween)

      //图片
      Image($r('app.media.jddog'))
        .width(120)
        .height(120)
        .margin({
          top: 100
        })

      //登录
      TextInput({placeholder:'国家/地址'})
        .margin({
          top: 40,
        })
      TextInput({placeholder:'请输入密码'})
        .type(InputType.Password)
        .margin({
          top: 20,
        })

      //协议
      Row(){
        Toggle({ type: ToggleType.Checkbox, isOn: false })
          .size({ width: 12, height: 12 })
          .selectedColor(Color.Pink)
        Text() {
          Span('我已经阅读并同意')
          Span('《京东隐私政策》《京东用户服务协议》').fontColor(Color.Blue)
          Span('未注册的手机号将自动创建京东账号')
        }
          .fontSize(12)
      }
      .width('95%')
      .margin({
        top: 20,
      })

      //登录按钮
      Button('登录')
        .width('100%')
        .backgroundColor(Color.Red)
        .margin({
          top: 20,
          bottom: 10
        })

      //注册 找回
      Row(){
        Text('新用户注册')
          .fontSize(14)
        Text('账号密码登录')
          .fontSize(14)
        Text('无法登录')
          .fontSize(14)
      }
      .width('95%')
      .justifyContent(FlexAlign.SpaceEvenly)

      //登录方式
      Row(){
        Column(){
          Text('其它登录方式')
            .fontSize(14)
          Row(){
            Image($r('app.media.huawei'))
              .width(30)
              .height(30)
            Image($r('app.media.weixin'))
              .width(30)
              .height(30)
            Image($r('app.media.weibo'))
              .width(30)
              .height(30)
            Image($r('app.media.QQ'))
              .width(30)
              .height(30)
          }
          .width('100%')
          .justifyContent(FlexAlign.SpaceEvenly)
          .margin({
            top: 20
          })
        }
        .width('100%')
      }
      .width('95%')
      .margin({
        top: 60
      })
    }
    .width('100%')
    .height('100%')
    .padding({
      left:15,
      right:15
    })
  }
}