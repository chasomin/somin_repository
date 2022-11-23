//
//  PetsFoodMapView.swift
//  TeamJasonList
//
//  Created by Jero on 2022/11/23.
//

import SwiftUI
import MapKit

struct AnnotatedItem: Identifiable {
    let id = UUID()
    var name: String
    var coordinate: CLLocationCoordinate2D
}



struct PetsFoodMapView: View {
    @ObservedObject var petStore: PetStore = PetStore(pets: [])
//    @State private var petData: [ResultList] = []
    var url: String
    var webService: WebService = WebService()
    
    @State private var region: MKCoordinateRegion = MKCoordinateRegion(
        center:
            CLLocationCoordinate2D(
                latitude: 40.75773,
                longitude: -73.985428),
        span: MKCoordinateSpan(
            latitudeDelta: 0.05,
            longitudeDelta: 0.05))
    
    @State private var annotatedItems: [AnnotatedItem] = []

    var body: some View {
        VStack {
            Map(coordinateRegion: $region, annotationItems: annotatedItems) { item in
                MapMarker(coordinate: item.coordinate, tint: .green)
            }
        }.navigationTitle("Pet Map")
        .onAppear {
            Task {
                //try 오류 처리
                petStore.pets = try await webService.fetchPetData(url: url)
                
                for pet in petStore.pets {
                    let coordinate = CLLocationCoordinate2D(latitude: Double(pet.latitude) ?? 0.0 , longitude: Double(pet.longitude) ?? 0.0 )
                    let annotatedItem = AnnotatedItem(name: "", coordinate: coordinate)
                    annotatedItems.append(annotatedItem)
                    region.center = coordinate
                }
            }
        }
    }
}

struct PetsFoodMapView_Previews: PreviewProvider {
    static var previews: some View {
        PetsFoodMapView(url: "")
    }
}
