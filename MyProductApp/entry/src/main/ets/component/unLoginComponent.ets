import { CustomContentDialog } from '@kit.ArkUI'
import { httpAPI } from 'GeneralModule'
import { userInfoModel, loginModel } from 'GeneralModule'
import { preferencesStorage } from 'GeneralModule'

@CustomDialog
struct loginDialogExample {
  controller?: CustomDialogController
  cancel: () => void = () => {
  }
  confirm: () => void = () => {
  }
  @State userLoginMsg: userInfoModel = {
    userName: '',
    password: ''
  }
  @State userName: string = ''
  @State password: string = ''
  @State loginMsg: loginModel | undefined = undefined

  build() {
    Column() {
      Text('登录')
        .fontWeight(FontWeight.Bold)
        .fontSize(20)
      TextInput({ placeholder: '请输入用户名', text: $$this.userName })
        .height(46)
        .backgroundColor(Color.Transparent)
        .borderRadius(10)
        .borderWidth(1)
        .borderColor('#e4e5eb')
        .margin({
          top: 20,
          bottom: 16
        })
      TextInput({ placeholder: '请输入密码', text: $$this.password })
        .type(InputType.Password)
        .height(46)
        .backgroundColor(Color.Transparent)
        .borderRadius(10)
        .borderWidth(1)
        .borderColor('#e4e5eb')
      Button('登录')
        .margin(20)
        .width(100)
        .height(40)
        .backgroundColor('#ff6d6d')
        .onClick(() => {
          this.userLoginMsg.userName = this.userName
          this.userLoginMsg.password = this.password
          console.log(JSON.stringify(this.userLoginMsg))
          httpAPI.getLogin('/api/v1/auth/login', this.userLoginMsg).then(res => {
            this.loginMsg = res as loginModel
            preferencesStorage.putData('token', this.loginMsg.data)
          })
          if (this.controller != undefined) {
            this.controller.close()
          }
        })
      Row() {
        Text('手机登录')
        Blank()
        Text('没有账号？立即注册')
      }
      .width('100%')
    }
    .padding({
      top: 20,
      left: 20,
      right: 20
    })
  }
}

@Component
export struct unLogin {
  @Prop txt: string
  dialogController: CustomDialogController | null = new CustomDialogController({
    builder: loginDialogExample({
      cancel: () => {
      },
      confirm: () => {
      },
    }),
    offset: { dx: 0, dy: 50 },
    width: '100%',
    height: 740,
  })

  build() {
    Column() {
      Text(this.txt)
        .width('100%')
        .height(45)
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .borderWidth({
          bottom: 1
        })
        .borderColor('#f0f3f5')

      Image($r('app.media.mihayo_unLogin'))
        .width(240)
        .height(200)
        .margin({
          top: 50
        })

      Text('快快开启新世界~')
        .fontColor('#989b9e')
        .margin({
          top: 10,
          bottom: 32
        })

      Button('登录')
        .width(100)
        .height(40)
        .backgroundColor('#ff6d6d')
        .onClick(() => {
          if (this.dialogController != null) {
            this.dialogController.open()
          }
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }
}