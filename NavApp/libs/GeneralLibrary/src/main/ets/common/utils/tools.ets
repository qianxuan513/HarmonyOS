import { rcp } from '@kit.RemoteCommunicationKit';
import { distributedKVStore } from '@kit.ArkData'
import { common } from '@kit.AbilityKit'

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
