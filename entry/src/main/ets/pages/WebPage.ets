import FaultLogger from '@ohos.faultLogger'
@Entry
@Component
struct WebPage {
  controller: WebController = new WebController()
  factor = 1.5
  @State webResult:string=''
  @State dataFromHtml:string=''
  testObj ={
    test:(data) =>{
      this.dataFromHtml = data
      return 'ArkUi Web Component'
    },
    toString:()=>{
      console.log('Web Component toString')
    }

  }
  build(){
    Column(){
      Row(){
        Button('前进').onClick(()=>{
          this.controller.forward()
        })
        Button('后退').onClick(()=>{
          this.controller.backward()
        })
        Button('刷新').onClick(()=>{
          this.controller.refresh()
        })
        Button('停止').onClick(()=>{
          this.controller.stop()
        })
        Button('清除历史').onClick(()=>{
          this.controller.clearHistory()
        })
      }.padding(12)
      .backgroundColor(Color.Gray)
      .width('100%')

      Web({ src: 'https://developer.harmonyos.com/', controller: this.controller })
        .onConsole((event)=>{
          console.log('getMessage:'+event.message.getMessage())
          return false
        })
    }
    .height('100%')
  }
  /*build() {
    Column() {
      Text(this.dataFromHtml)
      Row(){
        Button('Register JavaScript To Window').onClick(()=>{
          this.controller.registerJavaScriptProxy({
            object:this.testObj,
            name:'objName',
            methodList:['test','toString']
          })
          this.controller.refresh()
        })

        Web({ src: 'https://developer.harmonyos.com/', controller: this.controller })
          .onConfirm((event)=>{
            AlertDialog.show({
              title:'title',
              message:event.message,
              confirm:{
                value:'onAlert',
                action:() =>{
                  event.result.handleConfirm()
                }
              },
              cancel:()=>{
                event.result.handleCancel()
              }
            })
            return true
          })
            // 启用js交互
          .javaScriptAccess(true)
          .onPageEnd(e=>{
            this.controller.runJavaScript({
              script:'test()',
              callback:(result:string)=>{
                this.webResult = result
              }
            })
          })
        //.zoomAccess(true) // 点击放大
        // .textZoomRatio(150) 文字放大
      }
    }
  }*/
}