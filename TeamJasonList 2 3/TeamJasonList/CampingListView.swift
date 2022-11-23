//
//  CampingListView.swift
//  TeamJasonList
//
//  Created by 차소민 on 2022/11/23.
//

import SwiftUI
import MapKit

struct CampingListView: View {
    @ObservedObject var campingStore: CampingStore = CampingStore(campings: [])
    var url: String
    var webService: WebService = WebService()
    
        var body: some View {
            List{
                ForEach(campingStore.campings, id: \.self) { item in
                        NavigationLink {
                            CampingMapView(place: item, url: url)
                        } label: {
                            VStack{
                               
                                    VStack{
                                        HStack{
                                            Text("\(item.SI_DESC)")
                                                .font(.headline)
                                            
                                            Spacer()
                                        }
                                        HStack{
                                            Text(item.REFINE_LOTNO_ADDR)
                                            Spacer()
                                        }
                                    }
                                    
                                
                                CampingMapView(place: item, url: url)
                                    .frame(height: 150)
                            }
                        }
                    
                }
            }
            .onAppear{
                Task {
                    //try 오류 처리
                    campingStore.campings = try await webService.fetchCampingData(url: url)
                }
            }
            
        }
    }


struct CampingListView_Previews: PreviewProvider {
    static var previews: some View {
        CampingListView(url: "")
    }
}
