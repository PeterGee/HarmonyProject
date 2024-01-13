import display from '@ohos.display'
import CommonConstants from '../common/constant/CommonConstants'
import { RefreshConstants, RefreshHeaderStyle, RefreshState } from '../common/constant/RefreshConstants'
import DimensionUtil from '../common/utils/DimensionUtil'
import { GlobalContext } from '../common/utils/GlobalContext'
import RefreshComponent from '../view/RefreshComponent'

@Component
export default struct FileManagerIndex {
  @Provide(RefreshConstants.REFRESH_STATE_TAG) state: number = RefreshState.REFRESHING
  private deviceDisplay: display.Display = GlobalContext.getContext().getObject('display') as display.Display

  @Builder
  ContentBody() {
    Image($r('app.media.bg_content'))
      .width(CommonConstants.FULL_LENGTH)
      .height(DimensionUtil.getVp($r('app.float.content_height')))
      .objectFit(ImageFit.Fill)
  }

  build() {
    Stack({ alignContent: Alignment.Top }) {
      Text($r('app.string.file_index_title'))
        .backgroundColor(Color.White)
        .width(CommonConstants.FULL_LENGTH)
        .height(DimensionUtil.getVp($r('app.float.file_index_title_height')))
        .fontSize(DimensionUtil.getFp($r('app.float.file_index_title_size')))
        .fontWeight(FontWeight.Regular)
        .padding({ left: DimensionUtil.getVp($r('app.float.file_index_title_padding')) })
        .zIndex(CommonConstants.FILE_MANAGER_Z_INDEX)
      RefreshComponent({
        headerStyle: RefreshHeaderStyle.CLOUD,
        itemLayout: (): void => this.ContentBody(),
        displayHeight: (
          px2vp(this.deviceDisplay.height) - DimensionUtil.getVp($r('app.float.file_index_title_height'))),
        onRefresh: () => {
          setTimeout(() => {
            this.state = RefreshState.COMPLETE
          }, CommonConstants.REFRESH_DEFAULT_TIMEOUT)
        }
      })
        .width(CommonConstants.FULL_LENGTH)
        .margin({ top: DimensionUtil.getVp($r('app.float.file_index_title_height')) })
    }
    .height(CommonConstants.FULL_LENGTH)
  }
}