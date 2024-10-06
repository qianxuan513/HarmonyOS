import { rcp } from '@kit.RemoteCommunicationKit';
import { preferences } from '@kit.ArkData'
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { userInfoModel } from '../model/dataModel'

//定义基地址
export const baseUrl: string = 'http://172.23.32.1:1337'

//处理图片
export function dealImage(url: string) {
  if (url) {
    if (url.startsWith('http')) {
      return url
    } else {
      return baseUrl + url
    }
  } else {
    return ''
  }
}

//使用rcp发起网络请求
export class httpRequest {
  static setSession() {
    const session = rcp.createSession({
      baseAddress: baseUrl,
    })

    return session
  }

  static httpGet(url: string) {
    return httpRequest.setSession().get(url).then(res => {
      return res.toJSON()
    })
  }

  static httpPost(url: string, data: userInfoModel) {
    return httpRequest.setSession().post(url, data).then(res => {
      return res.toJSON()
    })
  }
}

//用户首选项数据持久化
export class preferencesStorage {
  //创建token数据持久化preferences实例
  static tokenPreferences: preferences.Preferences | null = null

  static tokenInit(context: common.UIAbilityContext) {
    //token表的配置项,Preferences实例配置选项,name就是Preferences实例的名称
    let options: preferences.Options = { name: 'userTokenStore' }
    //通过getPreferencesSync同步接口获取token的preferences实例
    preferencesStorage.tokenPreferences = preferences.getPreferencesSync(context, options);
  }

  //使用putSync()方法保存数据到缓存的Preferences实例中
  static putData(name: string, value: string) {
    preferencesStorage.tokenPreferences?.putSync(name, value)
  }

  //使用flush()方法实现数据持久化
  static flushData() {
    preferencesStorage.tokenPreferences?.flush(err => {
      console.log('数据持久化失败')
    })
  }

  //使用getSync()方法获取数据，即指定键对应的值。如果值为null或者非默认值类型，则返回默认数据。
  static getData(name: string) {
    return preferencesStorage.tokenPreferences?.getSync(name, '') as string
  }

  //使用deleteSync()方法删除指定键值对
  static deleteData(name: string) {
    preferencesStorage.tokenPreferences?.deleteSync(name)
  }
}