//
//  Home.swift
//  EcommApp
//
//  Created by Linoop K K on 12/12/21.
//

import SwiftUI

struct Home: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(spacing: 15){
                HStack(spacing: 15){
                    Image(systemName:"magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search",text: .constant(""))
                        .disabled(true)
                }
                .padding(.vertical, 12)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .strokeBorder(Color.gray,lineWidth: 0.8)
                )
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
