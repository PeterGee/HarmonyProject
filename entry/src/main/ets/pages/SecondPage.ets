import router from '@ohos.router'

@Entry
@Component
struct SecondPage{

  @State src:string =(router.getParams()?.['src'])

  build() {
    Column() {
      Text("返回上一个页面")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          router.back({
            url:'pages/FirstPage',
            params:{
              src:'SecondPage'
            }
          })
        })
      Text(this.src)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          router.back({
            url:'pages/FirstPage',
            params:{
              src:'SecondPage'
            }
          })
        })
    }
  }
}