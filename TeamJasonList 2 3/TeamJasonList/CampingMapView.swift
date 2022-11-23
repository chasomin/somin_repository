//
//  CampingMapView.swift
//  TeamJasonList
//
//  Created by 차소민 on 2022/11/23.
//

import SwiftUI
import MapKit

struct AnnotatedItem3: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}

struct CampingMapView: View {
    let place: Camping
    @ObservedObject var campingStore: CampingStore = CampingStore(campings: [])
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
                MapMarker(coordinate: item.coordinate, tint: .red)
            }
        }
        .navigationTitle("Camping Map")
        .onAppear {
            let coordinate = CLLocationCoordinate2D(latitude: Double(place.REFINE_WGS84_LAT) ?? 0, longitude: Double(place.REFINE_WGS84_LOGT) ?? 0)
            let annotatedItem = AnnotatedItem(name: place.SI_DESC, coordinate: coordinate)
            annotatedItems.append(annotatedItem)
            
            region.center = coordinate
            Task {
                //try 오류 처리
                campingStore.campings = try await webService.fetchCampingData(url: url)
            }
            
            
            
        }
    }
}
//
//struct CampingMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        CampingMapView(place: <#Camping#>, url: <#String#>)
//    }
//}
