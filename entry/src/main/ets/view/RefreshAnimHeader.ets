import CommonConstants from '../common/constant/CommonConstants';
import { RefreshConstants, RefreshState } from '../common/constant/RefreshConstants'
import DimensionUtil from '../common/utils/DimensionUtil';
import ClassifyModel from '../viewmodel/AnimationModel';

@Component
export default struct RefreshAnimHeader {
  @Consume(RefreshConstants.REFRESH_STATE_TAG) @Watch('onStateCheck') state: number;
  @State iconWidth: number = CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH

  private onStateCheck() {
    if (this.state == RefreshState.REFRESHING) {
      this.iconWidth = CommonConstants.REFRESH_HEADER_ITEM_SCALE_WIDTH
    } else {
      this.iconWidth = CommonConstants.REFRESH_HEADER_ITEM_DEFAULT_WIDTH
    }
  }

  @Builder AttrAnimIcons(iconItem: ClassifyModel) {
    Image(iconItem.imgRes)
      .width(px2vp(DimensionUtil.adaptDimension(this.iconWidth)))
      .position({ x: iconItem.posX })
      .objectFit(ImageFit.Contain)
      .animation({
        duration: CommonConstants.REFRESH_HEADER_ITEM_ANIM_DURATION,
        tempo: CommonConstants.REFRESH_HEADER_ITEM_ANIM_TEMPO,
        delay: iconItem.delay,
        curve: Curve.Linear,
        playMode: PlayMode.Alternate,
        iterations: CommonConstants.REFRESH_HEADER_ITEM_ANIM_ITERATIONS
      })
  }

  build() {
    Row() {
      if (this.state !== RefreshState.IDLE) {
        ForEach(CommonConstants.REFRESH_HEADER_FEATURE, (iconItem: ClassifyModel) => {
          this.AttrAnimIcons(iconItem)
        }, (item: ClassifyModel) => JSON.stringify(item))
      }
    }
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .onAppear(() => {
      this.onStateCheck()
    })
  }
}