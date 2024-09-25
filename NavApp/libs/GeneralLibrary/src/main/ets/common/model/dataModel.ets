//商品分类数据模型
export interface CategoryRoot {
  code: string
  data: CategoryData
  message: string
}

export interface CategoryData {
  secondCate: SecondCateData
  firstCate: FirstCateData[]
}

export interface SecondCateData {
  areaId: string
  cateType: string
  areaName: string
  labelEndTime: string
  patternEndTime: string
  patternStartTime: string
  paneKey: string
  level1words: Level1wordData[]
  title: string
  labelStartTime: string
}

export interface Level1wordData {
  level2words: Level2wordData[]
  keywordid: string
  secCateName: string
  keyword: string
  adGroupId: string
}

export interface Level2wordData {
  keywordId: string
  catId: string
  keyword: string
  url: string
  imageUrl: string
}

export interface FirstCateData {
  title: string
  paneKey: string
}