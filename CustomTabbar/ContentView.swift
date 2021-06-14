//
//  ContentView.swift
//  CustomTabbar
//
//  Created by Shaza Hassan on 09/06/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedTab: String = "house"
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView(selection: $selectedTab){

                HomeScreen()
                    .tag("house")

                NewsFeedScreen()
                    .tag("newspaper")

                SearchScreen()
                    .tag("magnifyingglass")

                NotificationScreen()
                    .tag("bell")

                MenuScreen()
                    .tag("text.justify")
            }
            
            CustomTabBar(selectedTab: $selectedTab)
                .shadow(radius: 5)
                .ignoresSafeArea()
        }
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
