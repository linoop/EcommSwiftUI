//
//  LoginPage.swift
//  EcommApp
//
//  Created by Linoop K K on 02/12/21.
//

import SwiftUI

struct LoginPage: View {
    @StateObject var loginViewModel:LoginViewModel = LoginViewModel()
    
    var body: some View {
        VStack{
            Text("Welcome\nBack")
                .font(.custom(customFont, size: 55).bold())
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .frame(height: getRect().height / 3.5)
                .padding()
                .background(
                    ZStack{
                        LinearGradient(colors: [Color("LoginCircle"), Color("LoginCircle").opacity(0.8), Color("purple")], startPoint: .top, endPoint: .bottom).frame(width: 100, height: 100).clipShape(Circle())
                            .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .topTrailing)
                            .padding(.trailing)
                            .offset(y: -25)
                            .ignoresSafeArea()
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 30, height: 30)
                            .blur(radius: 3)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                            .padding(30)
                        Circle()
                            .strokeBorder(Color.white.opacity(0.3), lineWidth: 3)
                            .frame(width: 23, height: 23)
                            .blur(radius: 2)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                            .padding(.leading,30)
                    }
                )
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing: 15){
                    Text(loginViewModel.registerUser ?"Register":"Login")
                        .font(.custom(customFont, size: 22).bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    CustomTextField(icon: "envelope", title: "Email", hint: "linoop@gmail.com", value: $loginViewModel.email, showPassword: .constant(false))
                        .padding(.top, 30)
                    
                    CustomTextField(icon: "lock", title: "Password", hint: "12345", value: $loginViewModel.password, showPassword: $loginViewModel.showPassword)
                        .padding(.top, 10)
                    
                    if loginViewModel.registerUser{
                        CustomTextField(icon: "lock", title: "Re-enter Password", hint: "12345", value: $loginViewModel.reEnterPassword, showPassword: $loginViewModel.showRenterPassword)
                            .padding(.top, 10)
                    }
                    
                    Button{
                        loginViewModel.forgetPassword()
                    } label: {
                        Text("Forgot password?")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("purple"))
                    }
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button{
                        if loginViewModel.registerUser{
                            loginViewModel.register()
                        }else{
                            loginViewModel.login()
                        }
                    } label: {
                        Text(loginViewModel.registerUser ?"Register":"Login")
                            .font(.custom(customFont, size: 17).bold())
                            .padding(.vertical, 20)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(Color("purple"))
                            .cornerRadius(15)
                            .shadow(color: Color.black.opacity(0.07), radius: 5, x: 5, y: 5)
                    }
                    .padding(.top, 25)
                    .padding(.horizontal)
                    
                    Button{
                        withAnimation{
                            loginViewModel.registerUser.toggle()
                        }
                    }label:{
                        Text(loginViewModel.registerUser ? "Back to login" : "Create account")
                            .font(.custom(customFont, size: 14))
                            .fontWeight(.semibold)
                            .foregroundColor(Color("purple"))
                    }
                    .padding(.top, 8)
                }
                .padding(30)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white
                            .clipShape(CustomCorners(corners: [.topLeft, .topRight], radius: 25)).ignoresSafeArea())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("purple"))
        .onChange(of: loginViewModel.registerUser){ newValue in
            loginViewModel.email = ""
            loginViewModel.password = ""
            loginViewModel.reEnterPassword = ""
            loginViewModel.showPassword = false
            loginViewModel.showRenterPassword = false
        }
    }
    
    @ViewBuilder
    func CustomTextField(icon: String, title: String, hint: String, value: Binding<String>, showPassword: Binding<Bool>)->some View{
        VStack(alignment: .leading, spacing: 12){
            Label{
                Text(title).font(.custom(customFont, size: 14))
                
            }icon:{
                Image(systemName: icon)
            }
            .foregroundColor(Color.black.opacity(0.8))
            
            if title.contains("Password") && !showPassword.wrappedValue{
                SecureField(hint, text: value)
                    .padding(.top, 2)
            }else{
                TextField(hint, text: value)
                    .padding(.top, 2)
            }
            Divider()
                .background(Color.black.opacity(0.4))
        }
        .overlay(
            Group{
                if title.contains("Password"){
                    Button(action: {
                        showPassword.wrappedValue.toggle()
                    }, label: {
                        Text(showPassword.wrappedValue ? "Hide" : "Show")
                            .font(.custom(customFont, size: 13).bold())
                            .foregroundColor(Color("purple"))
                    }).offset(y: 8)
                }
            }, alignment: .trailing)
    }
}

struct LoginPage_Previews: PreviewProvider {
    static var previews: some View {
        LoginPage()
        //    .previewDevice("iPhone 12")
        //LoginPage()
        //  .previewDevice("iPhone 8")
    }
}
