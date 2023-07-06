import SwiftUI

struct ContentView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        TabView {
            SettingView()
                .tabItem {
                    VStack{
                        Image(systemName: "slider.horizontal.3")
                        Text("表示条件の設定")
                    }
                }.tag(1)
            RentMapView()
                .tabItem {
                    VStack{
                        Image(systemName: "house")
                        Text("家賃相場地図")
                    }
                }.tag(2)
            CafeMapView()
                .tabItem {
                    VStack{
                        Image(systemName: "cup.and.saucer.fill")
                        Text("cafe数地図")
                    }
                }.tag(3)
            
        }
    }
}



struct SettingView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        ScrollView {
        VStack {
            CustomHeaderView()
            FloorTypeButton()
            CostButton()
        }
        }
    }
}

struct RentMapView: View {
    @EnvironmentObject var sharedData: SharedData
    
    var body: some View {
        VStack {
            MapView()
            }
    }
}

struct CafeMapView: View {
    var body: some View {
        VStack {
            MapView2()
        }
    }
}

struct CustomHeaderView: View {
    var body: some View {
        VStack {
        Text("相場情報可視化アプリ")
            .font(.headline)
            .foregroundColor(Color(UIColor(hex: "#B0E0E6")))
            .padding()
            .background(Color.gray)
            .frame(maxWidth: .infinity)
        }
        .background(Color.gray)
        .edgesIgnoringSafeArea(.all)
    }
    
}

class SharedData: ObservableObject {
    @Published var sharedVariable: String = "Hello"
    @Published var selectedColorCodes: Set<String> = ["#e6e6fa", "#f0e68c", "#ff69b4", "#ffff00", "#ff6347", "#6495ed", "#32cd32", "#bdb76b", "#ff4500", "#1e90ff", "#db7093", "#c71585", "#ff1493", "#d8bfd8", "#ffb6c1", "#ff8c00", "#00bfff", "#40e0d0", "#7cfc00"]
    @Published var selectedOption: String = "https://raw.githubusercontent.com/matumotokohei/rentMock/master/iOS_Json/iOS-1K.json"
}
