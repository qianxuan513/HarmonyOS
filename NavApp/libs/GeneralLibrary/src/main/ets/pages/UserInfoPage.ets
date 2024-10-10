import image from '@ohos.multimedia.image';
import { common } from '@kit.AbilityKit';
import { fileDownload } from '../common/utils/tools';
import { request } from '@kit.BasicServicesKit';
import fs from '@ohos.file.fs';

@Builder
export function UserInfoPageBuilder(name: string, param: Object) {
  UserInfoPage()
}

@Component
export struct UserInfoPage {
  @State message: string = '个人信息';
  @State userImage: image.PixelMap | undefined = undefined
  @State lhArr: image.PixelMap[] = []

  build() {
    Column() {
      Text(this.message)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .textAlign(TextAlign.Center)
        .backgroundColor(Color.White)
      Image(this.userImage)
        .width(100)
      Button('下载文件')
        .onClick(() => {
          let context = getContext() as common.UIAbilityContext
          let fileSavePath = context.cacheDir + "/u1.jpg" //文件存储路径
          fileDownload.loadFileFromServer(context,
            "https://img2.baidu.com/it/u=1264053764,192859798&fm=253&fmt=auto&app=138&f=JPEG?w=695&h=1215",
            fileSavePath, () => {
              this.userImage = fileDownload.fileOpen(fileSavePath)
            })
        })
      Button('下载压缩包')
        .onClick(() => {
          let context = getContext() as common.UIAbilityContext
          let zipSavePath = context.cacheDir + "/zip/" + "凌华.zip"
          if (context.cacheDir + "/zip") {
            fs.rmdirSync(context.cacheDir + "/zip") // 删除下载目录，先删除的目的是为了保证新下载的不报错
          }
          fs.mkdirSync(context.cacheDir + "/zip") // 创建下载目录
          fileDownload.loadFileFromServer(context,
            "http://192.168.14.56:5500/linhua.zip",
            zipSavePath, () => {
              this.lhArr = fileDownload.zipOpen(context, zipSavePath)
            })
        })
      List() {
        ForEach(this.lhArr, (item: image.PixelMap) => {
          ListItem() {
            Image(item)
              .height('100%')
              .width('100%')
          }
          .width(200)
          .height(300)
        })
      }
      .lanes(2)
    }
    .justifyContent(FlexAlign.Start)
    .width('100%')
    .height('100%')
    .backgroundColor('#ffdfe2e2')
  }
}
