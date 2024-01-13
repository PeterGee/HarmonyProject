@Entry
@Component
struct ContainerPage {
  build() {
    Column({
      space: 10
    }) {
      Image($r('app.media.icon'))
        .width(60)
        .height(60)
        .margin(20)

      Text("登录页面")
        .fontSize(20)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)

      Text("登录账号以使用更多服务")
        .fontSize(10)
        .fontColor(Color.Gray)
        .fontWeight(FontWeight.Normal)

      TextInput({ placeholder: "请输入账号:" })
        .type(InputType.Number)
        .margin(10)

      TextInput({ placeholder: "请输入密码:" })
        .type(InputType.Password)
        .margin(10)

      Row() {
        Text("短信验证码登录")
          .fontColor(Color.Blue)
        Text("忘记密码")
          .fontColor(Color.Blue)
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding(20)

      Button("登录", { type: ButtonType.Capsule, stateEffect: true })
        .fontColor(Color.White)

      Text("注册账号")
        .fontColor(Color.Blue)
        .fontSize(16)

      LoadingProgress()
        .color(Color.Blue)
        .width(20)
        .height(20)

      Text("其他方式登录")
        .fontSize(10)
        .fontColor(Color.Gray)

      Row() {
        Button("其他方式一", { type: ButtonType.Normal })
        Button("其他方式二", { type: ButtonType.Normal })
        Button("其他方式三", { type: ButtonType.Normal })
      }
      .justifyContent(FlexAlign.SpaceBetween)
    }
    .width("100%")
    .height("100%")
  }
}