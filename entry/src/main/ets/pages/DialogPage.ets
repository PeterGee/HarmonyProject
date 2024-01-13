
import CustomDialogWidget from './CustomDialogWidget';
@Entry
@Component
struct DialogPage {
  @State select: number = 2;
  private fruits: string[] = ['苹果', '橘子', '香蕉', '猕猴桃', '西瓜'];
  private selectedDate: Date = new Date('2010-1-1')

  @State birthdate: string = '';
  @State sex: string = '';
  @State hobbies: string = '';
  customDialogController: CustomDialogController = new CustomDialogController({
    builder: CustomDialogWidget({
      hobbies: $hobbies
    }),
    alignment: DialogAlignment.Bottom,
    customStyle: true,
    offset: {
      dx: 0,
      dy: -20
    }
  });


  build() {
    Row() {
      Column() {
        Row() {
          Button("AlertDialog")
            .onClick(() => {
              AlertDialog.show({
                title: "提示",
                message: "提示信息",
                autoCancel: true,
                alignment: DialogAlignment.Bottom,
                offset: { dx: 0, dy: -20 },
                primaryButton: {
                  value: "取消",
                  action: () => {
                    console.info("cancel")
                  }
                },
                secondaryButton: {
                  value: "删除",
                  fontColor: '#D94838',
                  action: () => {
                    console.log("delete")
                  }
                }
              })
            })

        }

        Row() {
          Button("TextPickerDialog")
            .margin(20)
            .onClick(() => {
              TextPickerDialog.show({
                range: this.fruits,
                selected: this.select,
                onAccept: (value: TextPickerResult) => {
                  this.select = value.index
                  console.log("TextPickerDialog:onAccept()" + JSON.stringify(value))
                },
                onCancel: () => {
                  console.log("TextPickerDialog:onCancel()")
                },
                onChange: (value: TextPickerResult) => {
                  console.log("TextPickerDialog:onChange" + JSON.stringify(value))
                }

              })
            })
        }

        Row() {
          Button("DatePickerDialog")
            .margin(20)
            .onClick(() => {
              DatePickerDialog.show({
                start: new Date('1900-1-1'),
                end: new Date('2023-12-31'),
                selected: this.selectedDate,
                lunar: false,
                onAccept: (value: DatePickerResult) => {
                  this.selectedDate.setUTCFullYear(value.year, value.month, value.day)
                  console.log("DatePickerResult:onAccept()" + JSON.stringify(value))
                },
                onCancel: () => {
                  console.log("TextPickerDialog:onCancel()")
                },
                onChange: (value: DatePickerResult) => {
                  console.log("DatePickerResult:onChange" + JSON.stringify(value))
                }

              })
            })
        }

        Row() {
          Button("CustomDialog")
            .margin(20)
            .onClick(() => {
              this.customDialogController.open
            })
        }
      }
      .width('100%')
    }
    .height('100%')
  }
}

