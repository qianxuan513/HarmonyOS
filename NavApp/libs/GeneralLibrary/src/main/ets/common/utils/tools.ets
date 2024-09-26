import { rcp } from '@kit.RemoteCommunicationKit';

//封装功能的文件
//封装rcp网络请求
export class recRequest {
  //创建rcp实例
  static setSession() {
    const session = rcp.createSession({
      headers: {
        origin: 'https://minicaty-pro.pf.jd.com'
      }
    })
    return session
  }

  //get请求
  static rcpGet(url: string) {
    recRequest.setSession().close()
    const session = recRequest.setSession()
    return session.get(url).then(res => {
      session.close()
      return res.toJSON()
    })
  }
}
