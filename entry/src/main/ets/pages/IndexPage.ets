import router from '@ohos.router'

@Entry
@Component
struct IndexPage {
  build() {
    Column({ space: 20 }) {
      Text("首页")
        .fontSize(20)
        .padding(20)

      Button('跳转第一页', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/FirstPage'
            }
          )
        })
      Button('跳转简单页面', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/TextDemo'
            }
          )
        })

      Button('跳转容器页面', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/ContainerPage'
            }
          )
        })

      Button('跳转列表页面', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/ListPage'
            }
          )
        })

      Button('跳转tab页面', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/TabPage'
            }
          )
        })

      Button('状态管理页面', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/StatePage'
            }
          )
        })

      Button('跳转视频页面', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/VideoPage'
            }
          )
        })

      Button('跳转弹窗页面', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/DialogPage'
            }
          )
        })

      Button('跳转动画页面', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/AnimPage'
            }
          )
        })
      Button('跳转Webpage页面', {
        type: ButtonType.Capsule
      })
        .onClick(() => {
          router.pushUrl(
            {
              url: 'pages/WebPage'
            }
          )
        })
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}