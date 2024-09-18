interface BannersRoot {
  code: number
  data: Banners[]
}

interface Banners {
  createdAt: number
  updatedAt: number
  id: number
  name: string
  coverImage: string
  desc: string
  link: string
  url: string
  category: number
}

export { BannersRoot, Banners }