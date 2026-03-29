@Entry
@Component
export default struct DemoTest {
  @Provide('NavPathStack') pathStack: NavPathStack = new NavPathStack();

  build() {
    Column() {
      Text("demo_test");
    }
  }
}