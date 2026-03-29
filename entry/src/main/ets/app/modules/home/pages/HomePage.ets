import { HomeDetailPage } from './HomeDetailPage';

@Entry
@Component
struct HomePage {
  @State message: string = 'Hello World';
  @Provide('NavPathStack') pathStack: NavPathStack = new NavPathStack();

  @Builder
  PagesMap(name: string) {
    if (name === 'PersonalInformation') {
      HomeDetailPage()
    }
  }

  build() {
    Navigation() {
      RelativeContainer() {
        Text(this.message)
          .id('HomePageHelloWorld')
          .fontSize($r('app.float.page_text_font_size'))
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          })
          .onClick(() => {
            this.message = 'Welcome';
          })
      }
      .height('100%')
      .width('100%')
    }
    .backgroundColor('#F1F3F5')
    .navDestination(this.PagesMap)
    .mode(NavigationMode.Stack)
    .hideToolBar(true)
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])

  }
}