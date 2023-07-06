//
//  MapView2.swift
//  TestApp2305
//
//  Created by matsumoto kouhei on 2023/06/22.
//

import SwiftUI
import MapKit
import Hue
import CoreLocation

struct MapView2: View {
    
    @State private var locations2: [Location] = []
    
    //マーカーの中心座標
    let coordinate = CLLocationCoordinate2D(latitude: 35.681236, longitude: 139.767125)
     let span = MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3)

    
    var body: some View {
        VStack {
            /*
             これを使えばリスト表示可能
            List(locations2) { location in
                Text(location.name)
            }
             */
            Map(
                coordinateRegion: .constant(MKCoordinateRegion(center: coordinate, span: span)),
                annotationItems: locations2
            ) {
                location in
                MapAnnotation(
                    coordinate: CLLocationCoordinate2D(
                        latitude: location.latitude,
                        longitude: location.longitude
                    )
                ) {
                    VStack {
                        let rentV = Int(location.rent)
                        Text("\(location.name)駅\n\(String(rentV))店")
                                .font(.custom("Helvetica",size: 13))
                                .foregroundColor(Color(UIColor(hex: location.color)))
                        Image(systemName: "cup.and.saucer.fill")
                            .font(.title2)
                            .foregroundColor(Color(UIColor(hex: location.color)))
                    }.fixedSize(horizontal: true, vertical: false)
                }
            }
            .onAppear(perform: fetchJson2)
        }
    }
        
    private func fetchJson2() {
        let url = URL(string: "https://raw.githubusercontent.com/matumotokohei/rentMock/master/iOS_Json/iOS-cafe.json")! // ここにAPIのURLを指定
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }

            if let data = data {
                do {
                    let jsonData = try JSONDecoder().decode(JSONData.self, from: data)
                    locations2 = jsonData.locations
                    if let firstLocation = locations2.first {
                        print("First Location: \(firstLocation)")
                    }
                } catch let error {
                    print("Error decoding JSON: \(error.localizedDescription)")
                }
            }
        }.resume()
   }
}
