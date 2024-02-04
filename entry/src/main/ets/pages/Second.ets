import router from '@ohos.router'

@Entry({ routeName: 'second' })
@Component
struct Second {
  @State message: string = 'Second Page'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)

        Button() {
          Text('Back')
            .fontSize(30)
            .fontWeight(FontWeight.Bold)
        }
        .type(
          ButtonType.Capsule
        )
        .margin({ top: 20 })
        .backgroundColor('#ff0d9ffb')
        .width('40%')
        .height('5%')
        .onClick(() => {
          console.debug('back')
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}