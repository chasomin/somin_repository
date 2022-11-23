//
//  jinjuListView.swift
//  TeamJasonList
//
//  Created by 차소민 on 2022/11/23.
//

import SwiftUI
import MapKit


struct JinjuListView: View {
    @ObservedObject var jinjuRestaurants: JinjuStore = JinjuStore(jinjues: [])
    var url: String
    var webService: WebService = WebService()
    
    var body: some View {
        List{
            ForEach(jinjuRestaurants.jinjues, id: \.self) { item in
                    NavigationLink {
                        JinjuView(place: item, url: url)
                    } label: {
                        VStack{
                            HStack {
                                Text("\(item.name)")
                                    .font(.headline)
                                Spacer()
                            }
                            JinjuView(place: item, url: url)
                                .frame(height: 150)
                        }
                    }
                
            }
        }
        .onAppear{
            Task {
                //try 오류 처리
                jinjuRestaurants.jinjues = try await webService.fetchJinjuData(url: url)
            }
        }
        
    }
}

//
//struct JinjuListView_Previews: PreviewProvider {
//    static var previews: some View {
//        JinjuListView(url: "")
//    }
//}
