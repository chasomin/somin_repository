//
//  JinjuView.swift
//  TeamJasonList
//
//  Created by 이소영 on 2022/11/23.
//

import SwiftUI
import MapKit

struct AnnotatedItem2: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}


struct JinjuView: View {
    let place: JinjuRestaurant
    @ObservedObject var jinjuRestaurants: JinjuStore = JinjuStore(jinjues: [])
    //    @State private var jinjuData: [JinjuRestaurant] = []
    var url: String
    var webService: WebService = WebService()
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 40.75773, longitude: -73.985708),
        span: MKCoordinateSpan(latitudeDelta: 0.005, longitudeDelta: 0.005)
    )
    
    @State private var annotatedItems: [AnnotatedItem] = []
    
    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: annotatedItems) { item in
                MapMarker(coordinate: item.coordinate, tint: .purple)
            }
        }
        .navigationTitle("Jinju Map")
        .onAppear {
            let coordinate = CLLocationCoordinate2D(latitude: Double(place.xposition) ?? 0, longitude: Double(place.yposition) ?? 0)
            let annotatedItem = AnnotatedItem(name: place.name, coordinate: coordinate)
            annotatedItems.append(annotatedItem)

            region.center = coordinate
            Task {
                //try 오류 처리
                jinjuRestaurants.jinjues = try await webService.fetchJinjuData(url: url)
            }

            
            
//            Task {
//                //try 오류 처리
//                jinjuRestaurants.jinjues = try await webService.fetchJinjuData(url: url)
//
//                for i in jinjuRestaurants.jinjues {
//                    print("=====================")
//                    print("name: \(i.name)")
//                    print("x: \(i.xposition), y: \(i.yposition)")
//
//                    let coordinate = CLLocationCoordinate2D(latitude: Double(i.xposition) ?? 0, longitude: Double(i.yposition) ?? 0)
//                    let annotatedItem = AnnotatedItem(name: i.name, coordinate: coordinate)
//                    annotatedItems.append(annotatedItem)
//                    region.center = coordinate
                }
                
                            
                
                //            for i in jinjuStore.jinjues {
                ////                if i.yposition != "" && i.xposition != "" {
                //                    let coordinate = CLLocationCoordinate2D(latitude: Double(i.xposition)!, longitude: Double(i.yposition)!)
                //                    let annotatedItem = AnnotatedItem(name: i.name, coordinate: coordinate)
                //                    annotatedItems.append(annotatedItem)
                //
                //                    region.center = coordinate
                //                    Task {
                //                        //try 오류 처리
                //                        jinjuStore.jinjues = try await webService.fetchJinjuData(url: url)
                //                    }
                ////                }
                //            }
                
            }
        }
    
    
    //

