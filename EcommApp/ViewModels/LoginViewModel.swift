//
//  LoginViewModel.swift
//  EcommApp
//
//  Created by Linoop K K on 02/12/21.
//

import Foundation

class LoginViewModel: ObservableObject{
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var showPassword: Bool = false
    
    @Published var registerUser: Bool = false
    @Published var reEnterPassword: String = ""
    @Published var showRenterPassword: Bool = false
    
    func login(){
        
    }
    
    func register(){
        
    }
    
    func forgetPassword(){
        
    }
}
