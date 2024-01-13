import Prompt from '@system.prompt'

@Entry
@Component
struct VideoPage {
  private videoUrl: string = "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
  private controller: VideoController
  private previewUris: Resource = $r('app.media.icon')
  private currentTime = 0

  build() {
    Row() {
      Column() {
        Video({
          src: this.videoUrl,
          previewUri: this.previewUris,
          controller: this.controller
        })
          .onUpdate((event) => {
            this.currentTime = event.time
          })
          .onPrepared((event) => {

          })
          .onError(() => {
            Prompt.showToast({
              duration: 1,
              message: "error"
            })
          })
          .controls(true)
          .autoPlay(true)
          .loop(false)

        VideoSlider({})

      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
export struct VideoSlider {
  private currentTime = 0

  build() {
    Row() {
      Image($r('app.media.app_icon'))
      Text("0:00")
      Slider({
        value: this.currentTime,
        min: 0,
        max: 100,
        step: 1,
        style: SliderStyle.OutSet
      })
        .blockColor(0xFFFFFF)
        .width(100)
        .trackColor(0xFF0000)
        .selectedColor(0xFFFFFF)
        .showSteps(true)
        .showTips(true)
        .trackThickness(100)

    }
  }
}