@Entry
@Component
export struct HomeDetailPage {
  @State message: string = 'Hello World';

  build() {
    NavDestination() {
      RelativeContainer() {
        Text(this.message)
          .id('HomeDetailPageHelloWorld')
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
    .onBackPressed(() => {
      return true;
    })
    .title("详情")
    .backgroundColor('#F1F3F5')
    .expandSafeArea([SafeAreaType.SYSTEM], [SafeAreaEdge.TOP, SafeAreaEdge.BOTTOM])

  }
}