import AbilityConstant from '@ohos.app.ability.AbilityConstant';
import hilog from '@ohos.hilog';
import UIAbility from '@ohos.app.ability.UIAbility';
import Want from '@ohos.app.ability.Want';
import window from '@ohos.window';
import { UIContext } from '@ohos.arkui.UIContext';

export default class EntryAbility extends UIAbility {
  private uiContext: UIContext | undefined = undefined

  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    let context = this.context
    console.info(`${context.abilityInfo.bundleName}`)

    let eventHub = context.eventHub
    eventHub.on('event1', this.onEvent1)
  }

  onNewWant(want: Want, launchParam: AbilityConstant.LaunchParam) {
    // parse want and launchParam
    this.uiContext?.getRouter()?.pushUrl({
      url: 'pages/Index'
    })
  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
    let eventHub = this.context.eventHub
    eventHub.off('event1')

  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/Index', (err, data) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });

    windowStage.getMainWindow().then((window) => {
      this.uiContext = window.getUIContext()
    })
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }

  onEvent1(data: string) {
    console.info(`receive ${data}`)
  }
}
