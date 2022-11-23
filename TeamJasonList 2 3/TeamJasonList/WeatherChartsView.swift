//
//  WeatherChartsView.swift
//  TeamJasonList
//
//  Created by 차소민 on 2022/11/23.
//

import SwiftUI
import Charts

struct WeatherChartsView: View {
    @ObservedObject var items: WeatherStore = WeatherStore(weathers: [])
    var url: String 
    var webService: WebService = WebService()
    

    var body: some View {
        VStack{
            Chart {
                ForEach(items.weathers, id: \.self) { item in
                    if item.category == "T1H"{
                        let indexEnd  =  item.fcstTime.index(item.fcstTime.endIndex, offsetBy: -2)
                        let strIndexEnd = String (item.fcstTime[..<indexEnd])
                        
                        LineMark(
                            
                            x:.value("시간", strIndexEnd),
                            
                            y:.value("기온", Int(item.fcstValue)!)
                        )
                        .foregroundStyle(Color.yellow)
                        
                    }
                }
            }
            //                .chartForegroundStyleScale([
            //                    "Green": .green, "Purple": .purple, "Pink": .pink, "Yellow": .yellow
            //                ])
            .padding()
            .navigationTitle("Weather")
            Text("시간에 따른 기온 변화")
                .font(.title3)
        }
        .onAppear {
            Task {
                //try 오류 처리
                items.weathers = try await webService.fetchWeatherData(url: url)
            }
        }
    }
}

struct WeatherChartsView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherChartsView(url: "")
    }
}
