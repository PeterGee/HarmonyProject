
@Entry
@Component
struct ListPage{
  private arr:number[] = [1,2,3,4,5,6,7,8]
  private gridArr: string[] = new Array(16).fill('').map((_, index) => `item ${index}`);

  build(){
    Column({space:20}){
      Row(){
        List({space:20}) {
          ForEach(this.arr, (item: number) => {
            ListItem() {
              Text(`${item}`)
                .width('100%')
                .height(50)
                .fontSize(20)
                .textAlign(TextAlign.Center)
                .borderRadius(20)
                .backgroundColor(0x007DEF)
            }
          }, item => item)
        }
        .listDirection(Axis.Vertical)
        .divider({
          strokeWidth:1,
          color:Color.Gray,
          startMargin:20,
          endMargin:20
        })
        .onScrollIndex((firstIndex:number,lastIndex:number)=>{
          console.info('first'+firstIndex)
          console.info('last'+lastIndex)
        })
        .onReachStart(()=>{
          console.info('onReachStart')
        })
        .onReachEnd(()=>{
          console.info('onReachEnd')
        })
        .onScrollStop(()=>{
          console.info('onScrollStop')
        })
      }.visibility(Visibility.Visible)


        Grid(){
            ForEach(this.gridArr,(item:string)=>{
              GridItem(){
                Text(item)
                  .fontSize(16)
                  .fontColor(Color.White)
                  .backgroundColor(0x007DFF)
                  .width('100%')
                  .height('100%')
                  .textAlign(TextAlign.Center)
              }
            },item =>item)
        }
      .columnsTemplate(`1fr 2fr 1fr 1fr`)
      .rowsTemplate(`1fr 2fr 1fr 1fr`)
      .columnsGap(10)
      .rowsGap(10)
      .height(100)
      }
    .width('100%')
    .padding(12)
    .backgroundColor(0xF1F3F5)

    }


}