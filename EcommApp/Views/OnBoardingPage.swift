//
//  OnBoardingPage.swift
//  EcommApp
//
//  Created by Linoop K K on 29/11/21.
//

import SwiftUI
let customFont = "Raleway-Regular"
struct OnBoardingPage: View {
    @State var showLoginPage: Bool = false
    var body: some View {
        VStack(alignment: .leading){
            Text("Find your\nGadgets")
                .font(.custom(customFont, size: 55))
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            Image("gadgets")
                .resizable()
                .padding()
                .aspectRatio( contentMode: .fit)
            
            Button{
                withAnimation{
                    showLoginPage = true
                }             
            }label: {
                Text("Get Started")
                    .font(.custom(customFont, size: 18))
                    .fontWeight(.semibold)
                    .padding(.vertical, 18)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .foregroundColor(Color("purple"))
            }
            .padding(.horizontal, 30)
            .offset(y: getRect().height < 750 ? 20 : 60)
            
            Spacer()
            
        }
        .padding()
        .padding(.top, getRect().height < 750 ? 0 : 20)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("purple"))
        .overlay(
            Group{
            if showLoginPage {
                LoginPage()
                    .transition(.move(edge: .bottom))
            }
        })
    }
}

struct OnBoardingPage_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingPage()
//            .previewDevice("iPhone 12")
//
//        OnBoardingPage()
//            .previewDevice("iPhone 8")
    }
}

extension View{
    func getRect()->CGRect{
        return UIScreen.main.bounds
    }
}
