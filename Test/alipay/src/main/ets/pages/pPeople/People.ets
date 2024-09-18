import { util } from '@kit.ArkTS'

//联系人分组
class pGroup {
  groupName: string = ''
  pConts: Array<object> | null = null
  key: string = ''
}

//联系人
class pCont {
  name: string
  icon: Resource

  constructor(name: string, icon: Resource) {
    this.name = name
    this.icon = icon
  }
}

//通讯录数据
let pDataArr: object[] = [
  {
    groupName: 'A',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake')),
      new pCont('阿雷基诺1', $r('app.media.sx_snake')),
      new pCont('阿雷基诺2', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'B',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake')),
      new pCont('阿雷基诺3', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'C',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'D',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'E',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'F',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'G',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'H',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'I',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'J',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'K',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup,
  {
    groupName: 'L',
    pConts: [
      new pCont('阿雷基诺', $r('app.media.sx_snake'))
    ],
    key: util.generateRandomUUID(true)
  } as pGroup
]

@Entry
@Component
struct People {
  @Builder
  itemHeader(title: string) {
    Text(title)
      .fontSize(20)
      .fontColor(Color.Black)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .padding({
        left: 5
      })
  }

  build() {
    Column() {
      Row() {
        Navigator({ target: 'pages/Index' }) {
          Text('<   返回')
        }
      }
      .width('100%')
      .padding({
        left: 10
      })
      .margin({
        bottom: 10
      })

      List() {
        ForEach(pDataArr, (pGroupItem: pGroup) => {
          ListItemGroup({ header: this.itemHeader(pGroupItem.groupName) })
          if (pGroupItem.pConts) {
            ForEach(pGroupItem.pConts, (pContItem: pCont) => {
              ListItem() {
                Row() {
                  Text(pContItem.name)
                    .height(40)
                }
                .width('100%')
              }
              .backgroundColor(Color.White)
            }, (pContItem: pCont) => JSON.stringify(pContItem))
          }
        }, (pGroupItem: pGroup) => JSON.stringify(pGroupItem))
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f6f6f6')
  }
}