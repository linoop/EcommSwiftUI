//
//  MainPage.swift
//  EcommApp
//
//  Created by Linoop K K on 12/12/21.
//

import SwiftUI

struct MainPage: View {
    @State var currentTab: Tab = .Home
    init(){
        UITabBar.appearance().isHidden = true
    }
    var body: some View {
        VStack(spacing: 0){
            TabView(selection: $currentTab){
                Home().tag(Tab.Home)
                Text("Liked").tag(Tab.Liked)
                Text("Cart").tag(Tab.Cart)
                Text("Profile").tag(Tab.Profile)
            }
            HStack(spacing: 0){
                ForEach(Tab.allCases, id: \.self){ tab in
                    Button{
                        currentTab = tab
                    }label:{
                        Image(tab.rawValue)
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio( contentMode: .fit)
                            .frame(width: 22, height: 22)
                            .background(
                                Color("purple")
                                    .opacity(0.1)
                                    .cornerRadius(5)
                                    .blur(radius: 5)
                                    .padding(-7)
                                    .opacity(currentTab==tab ? 1 : 0)
                            )
                            .frame(maxWidth: .infinity)
                            .foregroundColor(currentTab == tab ? Color("purple"): Color.black.opacity(0.3))
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .padding(.bottom, 10)
        }
        .padding()
    }
}

enum Tab: String, CaseIterable{
    case Home = "home"
    case Liked = "liked"
    case Cart = "cart"
    case Profile = "profile"
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}

