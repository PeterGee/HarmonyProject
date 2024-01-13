
@Entry
@Component
struct TextDemo{
  private picUrl = 'https://seopic.699pic.com/photo/50026/0831.jpg_wh1200.jpg'
  private text = ''
  private controller:TextInputController = new TextInputController()

  build(){
    Row(){
      Column({
        space:20
      }){
        Text('HarmonyOS')

        Text('HarmonyOSHarmonyOSHarmonyOSHarmonyOSHarmonyOSHarmonyOSHarmonyOSHarmonyOSHarmonyOSHarmonyOS')
          .width(200)
          .textAlign(TextAlign.Start)
          .maxLines(1)
          .textOverflow({
            overflow:TextOverflow.Ellipsis
          })
          .decoration({type:TextDecorationType.Underline,color:Color.Black})

        Text('HarmonyOS')
          .fontColor(Color.Blue)
          .width(200)
          .fontSize(20)
          .textAlign(TextAlign.Center)
          .fontStyle(FontStyle.Italic)
          .fontWeight(FontWeight.Bold)
          .fontFamily('Arial')
          .decoration({type:TextDecorationType.Overline,color:Color.Brown})

        Text('HarmonyOS')
          .width(200)
          .textAlign(TextAlign.End)
          .decoration({type:TextDecorationType.LineThrough})

        Image($r("app.media.app_icon"))
          .width(150)
          .height(150)
          .objectFit(ImageFit.Fill)
          .backgroundColor(0xCCCCCC)

        Image(this.picUrl)
          .width(200)
          .height(200)
          .objectFit(ImageFit.Fill)
          .backgroundColor(0xCCCCCC)

        TextInput({
          placeholder:'请输入密码'
        }).type(InputType.Password)

        TextInput({
          placeholder:'请输入邮箱'
        }).type(InputType.Email)

        TextInput({
          placeholder:'请输入电话号码',
          controller:this.controller
        })
          .caretColor(Color.Blue)
          .onChange((value:string)=>{
            this.text = value
          })
        Button({
          type:ButtonType.Normal,stateEffect:true
        }){
          Image($r('app.media.icon'))
            .width(30)
            .height(30)
        }
          .height(40)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .onClick(()=>{
            this.controller.caretPosition(2)
          })

      LoadingProgress().color(Color.Blue)
        .height(60)
        .width(60)
      }
      .width('100%')
      .alignItems(HorizontalAlign.Center)
      .padding(12)
      .backgroundColor(0xE6F2FD)
    }
    .backgroundColor(0xF1F3F5)
    .height('100%')
  }
}