import router from '@ohos.router'

@Entry
@Component
struct FirstPage {

  @State src:string ='';

  build() {
    Column() {
      Text("跳转下一个页main")
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/SecondPage',
            params: {
              src: 'FirstPage'
            }
          },router.RouterMode.Single)
        })
      Text(this.src)
        .fontSize(20)
    }
    .width('100%')
    .width("100%")

  }
}