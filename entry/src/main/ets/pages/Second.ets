import router from '@ohos.router'
import { StorageManager } from '../storage/StorageManager'

@Entry({ routeName: 'second', storage: StorageManager.getInstance().getSharedStorage('main') })
@Component
struct Second {
  @State message: string = 'Second Page'
  @StorageLink('propA') propA: number = 1

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
          this.propA++
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}