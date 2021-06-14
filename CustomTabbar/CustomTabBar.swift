//
//  CustomTabBar.swift
//  CustomTabbar
//
//  Created by Shaza Hassan on 09/06/2021.
//

import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: String
    // Storing Each Tab Midpoints to animate it in future...
    @State var tabPoints : [CGFloat] = []
    
    @State var xAxis: CGFloat = 0

    var body: some View {
        HStack(spacing:0){
            TabBarButton(image: "house",selectedTab: $selectedTab,tabPoints: $tabPoints)
            
            TabBarButton(image: "newspaper",selectedTab: $selectedTab,tabPoints: $tabPoints)
            
            TabBarButton(image: "magnifyingglass",selectedTab: $selectedTab,tabPoints: $tabPoints)
            
            TabBarButton(image: "bell",selectedTab: $selectedTab,tabPoints: $tabPoints)
            
            TabBarButton(image: "text.justify",selectedTab: $selectedTab,tabPoints: $tabPoints)

        }
        .padding()
        .background(Color.white.clipShape(TabCurve(xAxis: getCurvePoint() - 5)))
        .overlay(

            Circle()
                .fill(Color.blue)
                .frame(width: 10, height: 10)
                .offset(x: getCurvePoint() - 5)

            ,alignment: .topLeading
        )
    }
    
    func getCurvePoint()->CGFloat{

            // if tabpoint is empty...
            if tabPoints.isEmpty{
                return 10
            }
            else{
                switch selectedTab {
                case "house":
                    return tabPoints[4]
                case "newspaper":
                    return tabPoints[3]
                case "magnifyingglass":
                    return tabPoints[2]
                case "bell":
                    return tabPoints[1]
                default:
                    return tabPoints[0]
                }
            }
        }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
