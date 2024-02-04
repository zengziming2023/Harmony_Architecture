class Person implements Fly, Fly2, Fly3<number> {
  static nation: string
  protected name?: string
  protected age?: number
  static {
    Person.nation = ""
  }

  constructor(name: string, age: number) {
    this.name = name
    this.age = age

    let finalName = this.name?.toString() ?? "empty name"
    console.debug(`finalName = ${finalName}`)
  }

  fly3(data: number) {
    console.debug(`${data}`)
  }

  fly() {
    console.debug('person fly')
  }

  public test() {
    console.debug("person")
  }
}

class Child extends Person {
  public test() {
    super.test()

    console.debug("child")
  }

  fly() {
    super.fly()
    console.debug('child fly')
  }
}

interface Fly {
  fly()
}

interface Fly2 {
  fly(name: string)
}

interface Fly3<T> {
  fly3(data: T)
}

function add<T extends number>(a: T, b: T): T {
  // 强转？
  return (a + b) as T
}