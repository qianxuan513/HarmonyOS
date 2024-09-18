import axios, { AxiosResponse } from '@ohos/axios'
import { data } from '@kit.TelephonyKit'

const http = axios.create({
  baseURL: 'http://localhost:1337'
})

async function httpRequest(url: string, data: Record<string, number | string> = {}, method: string = 'GET') {
  return new Promise<string>((resolve: Function, reject: Function) => {
    http.request({
      url,
      data,
      method
    })
      .then((response: AxiosResponse<string>) => {
        resolve(response.data)
      })
  })
}

export {
  http, httpRequest
}