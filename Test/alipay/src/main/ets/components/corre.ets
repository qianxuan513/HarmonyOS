//父子通信
interface IArr {
  id: string
  name: string
}

class CArr implements IArr {
  id: string
  name: string

  constructor(id: string, name: string) {
    this.id = id
    this.name = name
  }
}

@Component
struct corr1 {
  @Prop arr1: CArr[] //父子单向
  @Link arr2: CArr[] //父子双向，不能有初始值

  build() {
    Column({ space: 16 }) {
      //单向数据传送
      List() {
        ForEach(this.arr1, (item1: CArr) => {
          ListItem() {
            Text(item1.name)
          }
        }, (item1: CArr) => item1.id)
      }

      Button('子组件单向添加')
        .onClick(() => {
          this.arr1.push(new CArr(`${this.arr1.length}`, '11'))
        })
      //双向数据传送
      List() {
        ForEach(this.arr2, (item2: CArr) => {
          ListItem() {
            Text(item2.name)
          }
        }, (item2: CArr) => item2.id)
      }

      Button('子组件双向添加')
        .onClick(() => {
          this.arr2.push(new CArr(`${this.arr2.length}`, '11'))
        })
    }
  }
}


@Entry
@Component
struct correspondence {
  @State arr1: CArr[] = [
    new CArr('0', '张三'),
    new CArr('1', '李四')
  ]
  @State arr2: CArr[] = [
    new CArr('0', '王五'),
    new CArr('1', '赵六')
  ]

  build() {
    Scroll() {
      Column() {
        Column({ space: 16 }) {
          corr1({ arr1: this.arr1, arr2: this.arr2 })
          Button('父组件单向添加')
            .onClick(() => {
              this.arr1.push(new CArr(`${this.arr1.length}`, '11'))
            })
          Button('输出单向')
            .onClick(() => {
              console.log(JSON.stringify(this.arr1))
            })
          Button('父组件单向添加')
            .onClick(() => {
              this.arr2.push(new CArr(`${this.arr2.length}`, '11'))
            })
          Button('输出双向')
            .onClick(() => {
              console.log(JSON.stringify(this.arr2))
            })
        }
        .width('100%')
        .height('100%')
        .backgroundColor(Color.Pink)
      }
    }
    .width('100%')
    .height('100%')
  }
}

// export { correspondence }