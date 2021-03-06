//
//  TabBarButton.swift
//  CustomTabbar
//
//  Created by Shaza Hassan on 09/06/2021.
//

import SwiftUI

struct TabBarButton: View {
    
    var image:String
    @Binding var selectedTab:String
    @Binding var tabPoints: [CGFloat]

    var body: some View {
        GeometryReader{reader -> AnyView in

                    // extracting MidPoint and Storing....
                    let midX = reader.frame(in: .global).midX

                    DispatchQueue.main.async {

                        // avoiding junk data....
                        if tabPoints.count <= 4{
                            tabPoints.append(midX)
                        }
                    }

                    return AnyView(

                        Button(action: {
                            // changing tab...
                            // spring animation...
                            withAnimation(.interactiveSpring(response: 0.6, dampingFraction: 0.5, blendDuration: 0.5)){
                                selectedTab = image
                            }
                        }, label: {

                            // filling the color if it' selected...

                            Image(systemName: image)
                                .font(.system(size: 25, weight: .semibold))
                                .foregroundColor(selectedTab == image ? .accentColor: .gray)
                        
                        })
                        // Max Frame...
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .contentShape(Rectangle())
                    )
                }
                // maxHeight..
                .frame(height: 50)
    }
}

struct TabBarButton_Previews: PreviewProvider {
    static var previews: some View {
        TabBarButton(image: "house", selectedTab: .constant(""),tabPoints: .constant([]))
    }
}
