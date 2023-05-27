import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        TabView {
            ChildView()
                .tabItem {
                    VStack{
                        Image(systemName: "a")
                        Text("Tab1")
                    }
                }.tag(1)
            AnotherChildView()
                .tabItem {
                    VStack{
                        Image(systemName: "bold")
                        Text("Tab2")
                    }
                }.tag(2)
            
        }
    }
}



struct ChildView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        ScrollView {
        VStack {
            Text(sharedData.selectedColorCodes.joined(separator: ", "))
            FloorTypeButton()
            CostButton()
        }
        }
    }
}

struct AnotherChildView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        VStack {
            Text(sharedData.selectedColorCodes.joined(separator: ", "))
            MapView()
            }
    }
}

class SharedData: ObservableObject {
    @Published var sharedVariable: String = "Hello"
    @Published var selectedColorCodes: Set<String> = ["#f0e68c"]
}
