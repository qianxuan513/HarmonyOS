import { rcp } from '@kit.RemoteCommunicationKit';
import { distributedKVStore } from '@kit.ArkData'
import { common } from '@kit.AbilityKit'
import { request, zlib } from '@kit.BasicServicesKit';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';

//封装功能的文件
//封装rcp网络请求
export class recRequest {
  //rcp实例只能创建16个
  private static session: rcp.Session
  //创建rcp时的配置信息
  static sessionConfig: rcp.SessionConfiguration = {
    requestConfiguration: {
      transfer: {
        timeout: {
          connectMs: 5000,
          transferMs: 10000,
        },
      },
    },
    // baseAddress: "http://api.example.com",
    headers: {
      "Authorization": "Bearer YOUR_ACCESS_TOKEN",
      "Content-Type": "application/json",
    }
  };

  //判断实例是否已经存在
  static rcpStorage(sessionConfig: rcp.SessionConfiguration) {
    //存在则返回已有的rcp实例
    if (recRequest.session) {
      return recRequest.session
    } else {
      recRequest.session = rcp.createSession(sessionConfig)
      return recRequest.session
    }
  }

  //get请求
  static rcpGet(url: string, sessionConfig = recRequest.sessionConfig) {
    return recRequest.rcpStorage(sessionConfig).get(url).then(res => {
      return res.toJSON()
    })
  }

  // //创建rcp实例
  // static setSession() {
  //   const session = rcp.createSession({
  //     headers: {
  //       origin: 'https://minicaty-pro.pf.jd.com'
  //     }
  //   })
  //   return session
  // }

  //get请求
  // static rcpGet(url: string) {
  //   recRequest.setSession().close()
  //   const session = recRequest.setSession()
  //   return session.get(url).then(res => {
  //     session.close()
  //     return res.toJSON()
  //   })
  // }
}

//键值型数据库存储

/**
 * 从远程下载文件
 * @param context       上下文
 * @param url           下载的文件的地址
 * @param fileSavePath  保存的路径地址
 * @param cb            回调函数
 */

export class fileDownload {
  //下载文件的方法
  static loadFileFromServer(context: common.UIAbilityContext, url: string, fileSavePath: string,
    cb: () => void) {
    request.downloadFile(context, {
      url,
      filePath: fileSavePath
    }).then(res => {
      res.on('progress', (receivedSize, totalSize) => {
        console.log(`下载中:${receivedSize}/${totalSize}`)
      })

      res.on('complete', () => {
        console.log('下载完成')
        cb()
      })
    })
  }

  //打开文件进行展示或其它操作
  static fileOpen(fileSavePath: string) {
    let file = fs.openSync(fileSavePath) // 打开文件，获取文件信息
    let imageSource = image.createImageSource(file.fd) // 创建一个ImageSource，对图片数据的修改或者编辑
    return imageSource.createPixelMapSync()
  }

  //压缩包解压操作
  static zipOpen(context: common.UIAbilityContext, zipSavePath: string) {
    let zipOutPath = context.cacheDir + "/zip/" + "outFiles"
    let zipArr: image.PixelMap[] = []
    fs.mkdirSync(zipOutPath) // 创建一个加压之后文件的存放位置
    //解压操作，使用zlib这个API进行压缩包解压
    zlib.decompressFile(zipSavePath, zipOutPath, (err) => {
      if (err) {
        console.log(err.message)
        return
      }
      console.log("解压缩成功了,解压之后的文件为:" + fs.listFileSync(zipOutPath).toString())
      fs.listFileSync(zipOutPath).forEach(item => {
        zipArr.push(fileDownload.fileOpen(zipOutPath + '/' + item))
      })
    })
    return zipArr
  }
}

//压缩包
