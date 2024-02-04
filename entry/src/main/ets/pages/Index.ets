import router from '@ohos.router';
import { BusinessError } from '@ohos.base';
import { ColorSet } from '../test/EnumTest'
import { TestMain } from '../test/TestMain'
import { StorageManager } from '../storage/StorageManager'

@Observed
class Message {
  message: string

  constructor(msg: string) {
    this.message = msg
  }
}

/**
 * @Entry -- 入口组件，根节点
 * @Component, @State 是装饰器
 * struct 自定义组件
 */
@Entry({ routeName: 'main', storage: StorageManager.getInstance().getSharedStorage('main') })
@Component
struct Index {
  // @State message: Message = new Message('Hello World');
  // @Provide('provide_message') message: Message = new Message('Hello World');
  @State message: Message = new Message('Hello World')
  @StorageLink('propA') @Watch('propAChange') propA: number = 1

  propAChange() {
    console.debug(`propA = ${this.propA}`)
  }

  build() {
    Row() {
      Column() {
        Text(this.message.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => {
            // this.textClick(this.message)
            // this.updateText(this.message)
            this.updateText2()
          })

        // this.textBuilder(this.message)
        // ChildText({ msg: this.message, click: this.updateText })
        // ChildText({ click: this.updateText })
        ChildText({ msg: this.message, click: this.updateText })

        Button() {
          Text(this.message.message)// 'Next'
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(
          ButtonType.Capsule
        )
        .margin({ top: 20 })
        .backgroundColor('#ff0d9ffb')
        .width('80%')
        .height('5%')
        .onClick(() => {
          let hi = "hello world."
          console.debug(`hi = ${hi}`)
          const h2 = 'hello world..'
          let names = ['a', 2, 'c']
          console.debug(`names = ${names.toString()}`)

          let color = ColorSet.WHITE

          new TestMain()._test()

          console.info("go to second page.")
          router.pushUrl({
            url: 'pages/Second'
          })// router.pushNamedRoute({ name: 'second' })
            .then(() => {
              console.info("success")
            }).catch((err: BusinessError) => {
            console.error('failed code:' + err.code + ', message = ' + err.message)
          })
        })

        // local storage
        Text(`propA = ${this.propA}`)
          .margin({ top: 20 })
          .fontSize(30)
          .onClick(() => {
            this.propA++
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  private updateText(message: Message) {
    let text = '';
    if (message.message == 'Hello ArkUI.') {
      text = 'Hello World';
    } else {
      text = 'Hello ArkUI.';
    }
    message.message = text;
    console.debug(`update text = ${message.message}`)
  }

  private updateText2() {
    let text = '';
    if (this.message.message == 'Hello ArkUI.') {
      text = 'Hello World';
    } else {
      text = 'Hello ArkUI.';
    }
    this.message.message = text;
    console.debug(`update text = ${this.message.message}`)
  }

  @Builder
  textBuilder(message: Message) {
    Text(message.message)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .onClick(() => {
        console.debug(`text message = ${message}`)
        // this.textClick(this.message)
        this.updateText(message)
      })
  }

  onPageShow() {
    console.debug(`${this} onPageShow`)
    console.debug(`message = ${this.message.message}`)
  }

  onPageHide() {
    console.debug(`${this} onPageHide`)
    console.debug(`message = ${this.message.message}`)
  }

  onBackPress() {
    console.debug(`${this} onBackPress`)
  }

  aboutToAppear() {
    console.debug(`${this} aboutToAppear`)
  }

  private textClick(message: Message) {
    console.debug('update text.')
    let text: string = ''
    if (message.message == 'Hello ArkUI.') {
      text = 'Hello World'
    } else {
      text = 'Hello ArkUI.'
    }
    message.message = text // = new Message(text)
    console.debug(`textClick message = ${message.message}, ${this.message.message}`)

  }
}

@Component
struct ChildText {
  // @State msg: Message = new Message("default message.")
  // @Prop message: Message = new Message("default message.")
  // @Link msg: Message
  // @Consume('provide_message') msg: Message
  @ObjectLink msg: Message
  click?: (msg: Message) => void

  build() {
    Text(this.msg.message)
      .fontSize(50)
      .fontWeight(FontWeight.Bold)
      .onClick((event) => {
        console.debug(`text message = ${this.msg.message}`)
        // if (this.click != undefined) {
        //   this.click(this.msg)
        // }
        let text = ''
        if (this.msg.message == 'Hello ArkUI.') {
          text = 'Hello World'
        } else {
          text = 'Hello ArkUI.'
        }
        this.msg.message = text
      })
  }
}