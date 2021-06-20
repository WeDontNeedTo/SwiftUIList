import SwiftUI

struct ActionTrashButton: View {
    @Binding var isSet: Bool
    @Binding var isDeleted: Bool
    @Binding var showActionSheet: Bool
    @ObservedObject var tasks: TaskList
    @Binding var idOfTask: Int
    
    var body: some View {
        Button(action: {
            self.showActionSheet.toggle()
        }, label: {
            Image(systemName: isSet ? "checkmark.circle" : "checkmark.circle.fill")
                .foregroundColor(.yellow)
        }).actionSheet(isPresented: $showActionSheet){
            ActionSheet(title: Text(""), message: Text(""), buttons: [
                ActionSheet.Button.default(Text("Восстановить"), action: {
                    isDeleted.toggle()
                }),
                ActionSheet.Button.destructive(Text("Удалить"), action: {
                }),
                ActionSheet.Button.cancel()
            ] ) }
    }
}

struct ActionTrashButton_Previews: PreviewProvider {
    static var previews: some View {
        ActionTrashButton(isSet: .constant(false), isDeleted: .constant(false), showActionSheet: .constant(false), tasks: TaskList(), idOfTask: .constant(0))
    }
}
