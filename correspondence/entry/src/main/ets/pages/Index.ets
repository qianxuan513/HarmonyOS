import { CPerson } from '../model/viewmodel/PersonVM'
import { Person } from '../model/datamodel/PersonDM'

@Entry
@Component
struct Index {
  @State PersonArr: Person[] = []
  @State PName: string = ''
  @State PAge: number = 0
  @State PSkill: string = ''

  build() {
    Column({ space: 10 }) {
      TextInput({
        placeholder: '输入名字',
        text: $$this.PName
      })
      TextInput({
        placeholder: '输入年龄',
        text: $$this.PAge
      })
      TextInput({
        placeholder: '输入技能',
        text: $$this.PSkill
      })
      Button('添加个人信息')
        .onClick(() => {
          this.PersonArr.push(new Person(this.PName, this.PAge, [{ skillsName: this.PSkill }]))
          this.PName = ''
          this.PAge = 0
          this.PSkill = ''
        })
      ForEach(this.PersonArr, (item: Person) => {
        CPerson({pName:item.name,pAge:item.age,pSkills:item.skills})
      }, (item: Person) => item.id)

    }
    .height('1005')
    .width('100%')
  }
}