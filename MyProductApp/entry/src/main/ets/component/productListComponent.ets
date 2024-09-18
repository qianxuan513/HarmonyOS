import { Product, ProductCategory } from '../model/dataModel'

@Component
export struct productList {
  @Prop productArr: Product

  build() {
    Column() {
      Image(this.productArr.coverImage)
        .width('100%')
        .borderRadius(10)
        .margin({
          bottom: 10
        })
      Text(this.productArr.name)
        .maxLines(2)
        .textOverflow({
          overflow: TextOverflow.Ellipsis
        })
        .width('100%')
        .height(30)
        .margin({
          bottom: 10
        })
      Text('￥' + this.productArr.price + '元')
        .width('100%')
        .fontColor('#ff6d6d')
        .fontStyle(FontStyle.Italic)
        .fontWeight(FontWeight.Bold)
        .height(20)
    }
    .width('40%')
    .margin({
      bottom: 10
    })
  }
}