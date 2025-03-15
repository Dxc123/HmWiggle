import { Constants } from '../common/Constants';
import hilog from '@ohos.hilog';

@Entry
@Component
struct Index {
  @State currentIndex: number = 0;
  private tabsController: TabsController = new TabsController();

  @Builder
  tabBuilder(title: Resource, index: number, selectedImg: Resource, normalImg: Resource) {
    Column() {
      Image(this.currentIndex === index ? selectedImg : normalImg)
        .width(24)
        .height(24)
        .objectFit(ImageFit.Contain)
      Text(title)
        .margin({ top: 4 })
        .fontSize(10)
        .fontColor(this.currentIndex === index ? '#3388ff' : '#E6000000')
    }
    .justifyContent(FlexAlign.Center)
    .height(52)
    .width('100%')
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  @Builder
  tabContentBuilder(text: Resource, index: number, selectedImg: Resource, normalImg: Resource) {
    TabContent() {
      Row() {
        Text(text)
          .height(300)
          .fontSize(30)
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
    }
    .padding({ left: 12, right: 12 })
    .backgroundColor(Color.White)
    .tabBar(this.tabBuilder(text, index, selectedImg, normalImg))
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabsController
    }) {
      this.tabContentBuilder($r('app.string.tab_home'),
        Constants.TAB_INDEX_ZERO, $r('app.media.tab_home_active'), $r('app.media.tab_home'))
      this.tabContentBuilder($r('app.string.tab_discover'),
        Constants.TAB_INDEX_ONE, $r('app.media.tab_discover_active'), $r('app.media.tab_discover'))
      this.tabContentBuilder($r('app.string.tab_message'),
        Constants.TAB_INDEX_TWO, $r('app.media.tab_message_active'), $r('app.media.tab_message'))
      this.tabContentBuilder($r('app.string.tab_me'),
        Constants.TAB_INDEX_TWO, $r('app.media.tab_me_active'), $r('app.media.tab_me'))
    }
    .width('100%')
    .backgroundColor('#F3F4F5')
    .barHeight(52)
    .barMode(BarMode.Fixed)
    .onAnimationStart((index: number, targetIndex: number) => {
      hilog.info(0x0000, 'index', index.toString());
      this.currentIndex = targetIndex;
    })
  }
}