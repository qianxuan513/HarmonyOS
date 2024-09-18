import axios, { AxiosResponse } from '@ohos/axios'

const ax = axios.create({})

interface IMiHaYoData {
  goods_id: string
  name: string
  cover_url: string
  market_price: number
  price: number
  tag: number
  sale_time: number
  is_sold_out: boolean
  remaining_time: number
  presale: boolean
  status: number
}

export function getMiHaYoProduct() {
  ax.request<IMiHaYoData>({
    url: 'https://api-mall.mihoyogift.com/common/homeishop/v1/goods/puzzle_goods_info?puzzle_id=mall_cn__1726133285&component_id=pz-eWUweyahLE',
    method: 'GET'
  }).then((r: AxiosResponse<IMiHaYoData>) => {
    console.log(JSON.stringify(r))
  })
}
