import HobbyBean from '../viewmodel/HobbyBean'

@CustomDialog
export default struct CustomDialogWidget {
  @State hobbyBeans: HobbyBean[] = []
  @Link hobbies: string
  private controller?: CustomDialogController

  aboutToAppear() {
    let context: Context = getContext(this)
    let manager = context.resourceManager
    manager.getStringArrayValue($r('app.strarray.hobbies_data'), (error, hobbyResult) => {
      hobbyResult.forEach((hobbyItem: string) => {
        let hobbyBean = new HobbyBean()
        hobbyBean.label = hobbyItem
        hobbyBean.isChecked = false
        this.hobbyBeans.push(hobbyBean)
      })
    })
  }

  setHobbyValue(hobbyBeans: HobbyBean[]) {
    let hobbiesText: string = '';
    hobbiesText = hobbyBeans.filter((isCheckItem: HobbyBean) =>
    isCheckItem?.isChecked).map((checkedItem: HobbyBean) => {
      return checkedItem.label;
    }).join(',')
    this.hobbies = hobbiesText
  }

  build() {
    Column() {
      Text("爱好")
      List() {
        ForEach(this.hobbyBeans, (itemHobby: HobbyBean) => {
          ListItem() {
            Row() {
              Text(itemHobby.label)
              Toggle({
                type: ToggleType.Checkbox, isOn: false
              }).onChange((isCheck) => {
                itemHobby.isChecked = isCheck
              })
            }
          }
        }, itemHobby => itemHobby.label)
      }

      Row() {
        Button('取消').onClick(() => {
          this.controller?.close()
        })
        Button('设置').onClick(() => {
          this.setHobbyValue(this.hobbyBeans)
          this.controller?.close()
        })
      }

    }
  }
}



