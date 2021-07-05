import SwiftUI
struct RecoveryButton: View {
    @Binding var showActionSheet: Bool
    @Binding var isDelete : Bool
    var taskId : Int
    @Binding var taskName : String
    @ObservedObject var tasks: TaskItemModel
        var body: some View {
    
            Button(action: {
                self.showActionSheet.toggle()}, label: {
                })
            .actionSheet(isPresented:$showActionSheet){
                ActionSheet(title: Text("Что вы хотите сделать с задачей:"), message: Text(taskName),buttons: [
                                ActionSheet.Button.default(Text("Востановить"), action: {isDelete.toggle()
                                    }),
                                ActionSheet.Button.destructive(Text("Удалить"), action:
                                    {tasks.toDoElements.remove(at: taskId)
                                    }),
                                ActionSheet.Button.cancel()])
            }
    }
}

struct RecoveryButton_Previews: PreviewProvider {
    static var previews: some View {
        RecoveryButton(showActionSheet: .constant(false), isDelete: .constant(false),taskId: 0,taskName: .constant(""),tasks: TaskItemModel())
    }
}
