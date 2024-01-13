import FaultLogger from '@ohos.faultLogger'
@Entry
@Component
struct TabPage {
  private controller: TabsController = new TabsController()
  @State currentIndex:number = 0

  build() {
    // 默认效果
  /*  Column() {
      Tabs({ barPosition: BarPosition.End}) {
        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Green)
        }
        .tabBar('green')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Blue)
        }
        .tabBar('blue')

        TabContent() {
          Column().width('100%').height('100%').backgroundColor(Color.Yellow)
        }
        .tabBar('yellow')

      TabContent() {
        Column().width('100%').height('100%').backgroundColor(Color.Pink)
      }
      .tabBar('pink')
      }
      .barMode(BarMode.Scrollable)
      .vertical(true)
      .barWidth(100)
      .barHeight(200)
      .width('100%')
      .height('100%')
      .backgroundColor(0xF5F5F5)
    }
    .width('100%')
    .height('100%')
    .visibility(Visibility.None)*/

    Tabs({barPosition:BarPosition.End,controller:this.controller}){
      TabContent(){
        Column().width('100%').height('100%').backgroundColor('#00CB87')
      }
      .tabBar(this.TabBuilder('首页',0,$r('app.media.ic_default'),$r('app.media.app_icon')))

      TabContent(){
        Column().width('100%').height('100%').backgroundColor('#00CB87')
      }
      .tabBar(this.TabBuilder('我的',0,$r('app.media.ic_ok'),$r('app.media.app_icon')))

    }
    .barWidth('100%')
    .barHeight(50)
    .onChange((index:number)=>{
      this.currentIndex = index
    })

  }

  // 自定义样式
  @Builder TabBuilder(title:string,targetIndex:number,selectedImg:Resource,normalImg:Resource){
    Column(){
      Image(this.currentIndex == targetIndex? selectedImg:normalImg)
        .size({width:25,height:25})
      Text(title)
        .fontColor(this.currentIndex == targetIndex?'#1698CE' : '#6B6B6B')
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .onClick(()=>{
      this.currentIndex = targetIndex
      this.controller.changeIndex(this.currentIndex)
    })
  }
}