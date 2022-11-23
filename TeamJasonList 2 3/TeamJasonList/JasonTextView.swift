////
////  JasonTextView.swift
////  TeamJasonList
////
////  Created by Sue on 2022/11/23.
////
//
//import SwiftUI
//
//struct JasonTextView: View {
//    
//    //@ObservedObject var campingStore: CampingStore = CampingStore(campings: [])
//    
////    let kshUrl: String = "https://mocki.io/v1/cfe9c0af-02e6-49a5-b8b0-ee9acd0e7f6b"
//    
//    var url: String
//    var webService: WebService = WebService()
//    
//    @State private var showingData: String = ""
//    
//    var body: some View {
//        VStack{
//            Text("\(showingData)")
//                .onAppear {
//                    Task {
//                        //try 오류 처리
//                        showingData = try await webService.fetchCampingData(url: url)
//                    }
//                }
//        }//v
//    }//body
//}
//
//struct JasonTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        JasonTextView(url: "")
//    }
//}
