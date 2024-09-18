interface ISkills {
  skillsName: string
}

interface IPerson {
  name: string,
  age: number,
  skills: ISkills[]
}

class Person implements IPerson {
  id: string = 'D' + Date.now() + Math.random() * 99999
  name: string
  age: number
  skills: ISkills[]

  constructor(name: string, age: number, skills: ISkills[]) {
    this.name = name
    this.age = age
    this.skills = skills
  }
}

export {ISkills, Person }