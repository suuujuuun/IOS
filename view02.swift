import SwiftUI
import CoreData


struct ToDoItem: Identifiable {
    let id = UUID()
    let task: String
    let imageName: String
}

struct ContentView: View {
    
    @State private var toggleStatus = true
    @State var listData: [ToDoItem] = [
        ToDoItem(task: "Take out the trash", imageName:"trash.circle.fill"),
        ToDoItem(task: "Pick up the kids", imageName:"person.2.fill"),
        ToDoItem(task: "Wash the car", imageName:"car.fill")
        
    ]
    
    
    var body : some View {
       
        NavigationStack{
            List {
                Section(header: Text("Setting")){
                    Toggle(isOn: $toggleStatus) {
                        Text("Allow Notifications")
                    }
                }
                Section(header:Text("To Do Tasks")){
                    ForEach (listData) { item in
                        NavigationLink(value:item.task){
                            
                            HStack {
                                Image(systemName: item.imageName)
                                Text(item.task)
                            }}}
                }
                .refreshable {
                    listData = [
                        ToDoItem(task: "Take out the trash", imageName:"trash.circle.fill"),
                        ToDoItem(task: "Pick up the kids", imageName:"person.2.fill"),
                        ToDoItem(task: "Wash the car", imageName:"car.fill")
                        
                    ]
                }
            }
            

        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/*
List {
    Text("Wash the car")
    Text("Vacuum house")
    Text("Pick up kids from school bus @ 3pm")
    Text("Auction the kids on eBay")
    Text("Order Pizza for dinner")
}


List {
    HStack {
        Image(systemName: "trash.circle.fill")
        Text("Take out the trash")
    }
    HStack {
        Image(systemName: "person.2.fill")
        Text("Pick up the kids")
    }
    HStack {
        Image(systemName: "car.fill")
        Text("Was the car")
    }
}
*/
