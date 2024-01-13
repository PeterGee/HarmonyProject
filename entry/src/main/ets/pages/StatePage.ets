
@Component
struct StatePage {
  @Prop isExpanded: boolean
  @Link @Watch('onClickIndexChanged') clickIndex: number;
  index:number

  onClickIndexChanged() {
    if (this.clickIndex != this.index) {
      this.isExpanded = false;
    }
  }
  build() {
    Row() {
      Text('statePage')
        .backgroundColor('#00CB87')
      if (this.isExpanded){
        Checkbox()
      }
    }
    .height(this.isExpanded ? 100 : 20)
    .onClick(() => {
      this.isExpanded = !this.isExpanded
    })
  }
}

@Entry
@Component
export default struct TargetList {
  @State isEditMode: boolean = false
  private arr:number[] = [1,2,3,4,5,6,7,8]
  @State mClickIndex:number =0

  build() {
    Column() {
      Row() {
        if (this.isEditMode) {
          Text("取消")
            .onClick(() => {
              this.isEditMode = !this.isEditMode
            })
          Text("全选")
          Checkbox()
        } else {
          Text("编辑")
            .onClick(() => {
              this.isEditMode = true
            })

        }
      }
      
      List({space:20}){
        ForEach(this.arr,(item:StatePage,childIndex:number) =>{
          ListItem(){
            StatePage({isExpanded:this.isEditMode,clickIndex:$mClickIndex})
          }
          .width('100%')
          .height(50)
        },(item,index)=>JSON.stringify(item)+index)
      }

      if (this.isEditMode){
        Button("删除")
          .margin(20)
      }else {
        Button("添加任务")
      }
    }
  }
}