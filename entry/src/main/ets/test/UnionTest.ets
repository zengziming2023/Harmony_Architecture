export type Animal = Cat | Dog | number

export class Cat {
  eat() {
    console.debug('cat eat..')
  }
}

export class Dog {
  eat() {
    console.debug('dog eat..')
  }
}