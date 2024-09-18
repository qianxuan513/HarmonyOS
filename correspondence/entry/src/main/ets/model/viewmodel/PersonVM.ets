import { ISkills, Person } from '../datamodel/PersonDM'

@Builder
function PersonInfo(info: string) {
  Text(info)
    .width('100%')
}

@Component
struct CSkills {
  @Prop cSkills: ISkills[]

  build() {
    List() {
      ForEach(this.cSkills, (item: ISkills) => {
        ListItem() {
          Text(item.skillsName)
        }
      }, (item: ISkills) => item.skillsName)
    }
  }
}

@Component
struct CPerson {
  @Prop pName: string
  @Prop pAge: number
  @Prop pSkills: ISkills[]
  @State newSkill: string = ''
  @State status: boolean = false

  build() {
    Column() {
      PersonInfo(`名字：${this.pName}`)
      PersonInfo(`年龄：${this.pAge}`)
      PersonInfo('技能：')
      CSkills({ cSkills: this.pSkills })
      Row() {
        Button('修改名字')
        Button('添加技能')
          .onClick(() => {
            this.status = true
          })
        Button('删除技能')
      }

      if (this.status) {
        TextInput({
          placeholder: '输入技能',
          text: $$this.newSkill
        })
          .onSubmit(() => {
            this.pSkills.push({ skillsName: this.newSkill })
            this.status = false
          })
      }
    }
    .width('100%')
    .backgroundColor(Color.Pink)
  }
}

export { CPerson }