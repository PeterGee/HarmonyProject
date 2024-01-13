import CommonConstants from '../common/constant/CommonConstants'
import DimensionUtil from '../common/utils/DimensionUtil'
import CardModel from '../viewmodel/CardModel'
import FileManagerIndex from './FileManagerIndex'

@Entry
@Component
struct AnimPage {
  @State currentPage: number = CommonConstants.INDEX_DEFAULT_SELECT

  @Builder TabBuilder(item: CardModel, index: number) {
    Column() {
      Image(this.currentPage === index ? item.selectedIcon : item.defaultIcon)
        .width(DimensionUtil.getVp($r('app.float.index_tab_icon_size')))
        .height(DimensionUtil.getVp($r('app.float.index_tab_icon_size')))
        .objectFit(ImageFit.Contain)

      Text(item.content)
        .fontColor(this.currentPage === index ? $r('app.color.index_tab_font_color') : Color.Black)
        .fontSize(DimensionUtil.getFp($r('app.float.index_tab_font_size')))
        .margin({ top: DimensionUtil.getVp($r('app.float.index_tab_vertical_margin')) })
        .opacity(this.currentPage === index ? $r('app.float.index_tab_font_selected_opacity')
                                            : $r('app.float.index_tab_font_default_opacity'))

    }
    .justifyContent(FlexAlign.Center)
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
  }

  build() {
    Tabs({ barPosition: BarPosition.End, index: this.currentPage }) {
      ForEach(CommonConstants.INDEX_TAB, (item: CardModel, index: number) => {
        TabContent() {
          if (index === CommonConstants.INDEX_DEFAULT_SELECT) {
            FileManagerIndex()
          }
        }
        .tabBar(this.TabBuilder(item, index))
      }, (item: CardModel) => JSON.stringify(item))
    }
    .width(CommonConstants.FULL_LENGTH)
    .height(CommonConstants.FULL_LENGTH)
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentPage = index
    })
  }
}

