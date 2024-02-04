import { Animal, Cat, Dog } from './UnionTest'

type Matrix = number[][]
type Hanlder = (s: string, no: number) => string
type NullableObject = object | null | undefined

type stringNull = string | null

export class TestMain {
  _test(): void {
    let ob: NullableObject
    console.debug(`ob = ${ob}`)
    let animal: Animal = new Cat()
    animal = new Dog()
    animal = 4

    // if (animal instanceof Cat) {
    //   (animal as Cat).eat()
    // }

    let key = 1
    switch (key) {
      case 1:
      // console.debug(`key = ${key}`)
        break;

      default:
        break;
    }

    // 三元表达式
    let isValid = key == 1 ? true : false

    let sum = 0
    for (let i = 0; i < 10; i++) {
      sum += i
    }

    let array = [1, 2, 3, 4, 5]
    for (let a of array) {
      // console.debug(`${a}`)
    }

    let n = 0
    while (n < 3) {
      n++
    }

    do {
      n++
    } while (n < 3)

    // 箭头函数 或 lambda函数
    let add = (a: number, b: number) => a + b
    let result = add(1, 2)

    let z = f()
    console.debug(`z1 = ${z()}`)
    console.debug(`z2 = ${z()}`)

    // typeof
    console.debug(`z type = ${typeof z}`)

    console.debug((`${z instanceof Cat}`))

    let func = () => {
      return 1
    }
    func()
  }
}

export function divide(a: number, b: number): number {
  if (b == 0) throw new Error
  return a / b
}

/**
 * 可选参数 ？
 * 默认参数
 * @param name
 */
function hello(name?: string, age: number = 18) {
  if (name == undefined) {

  } else {

  }
}

function sum(...numbers: number[]): number {
  let res = 0
  for (let n of numbers) {
    res += n
  }
  return res
}

/**
 * 智能推断返回类型
 * @returns
 */
function sum2() {
  return 1
}

// 闭包: 函数的返回值是一个函数 -- 内部函数可以访问外部变量count，
function f(): () => number {
  let count = 0
  return () => {
    count++
    return count
  }
}

// 函数重载 -- 不行？
function foo(): void {
  try {

  } catch (e) {
  }
}

// function foo(name: string): void {
//
// }
