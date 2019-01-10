<<<<<<< HEAD


import Foundation


public class User  {


    var id: Int
    var email: String
    var password: String
    var name: String
    
    init() {
        id = "?"
        email = "?"
        password = ?
        name = ?
    }
    
    init(id: String, email: String, password: String, name: String) {
        self.id = id
        self.email = email
        self.password = password
        self.name = name
    }
    
    public var descriptor: String {
        return "User(\(id),\(email),\(password),\(name))"
=======
//
//  User.swift
//  ProjetIF26
//
//  Created by Vincent on 08/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

class User {

    private var id: Int
    private var email: String
    private var password: String
    private var userName: String
    
    init(id: Int, email: String, password: String, userName: String) {
        self.id = id
        self.email = email
        self.password = password
        self.userName = userName
    }
    
    init(email: String, password: String, userName: String) {
        self.id = -1
        self.email = email
        self.password = password
        self.userName = userName
    }
    
    func getId() -> Int {
        return self.id
    }
    
    func setId(id: Int) {
        self.id = id
    }
    
    func getEmail() -> String {
        return self.email
    }
    
    func setEmail(email: String) {
        self.email = email
    }
    
    func getPassword() -> String {
        return self.password
    }
    
    func setPassword(password: String) {
        self.password = password
    }
    
    func getUserName() -> String {
        return self.userName
    }
    
    func setUserName(userName: String) {
        self.userName = userName
    }
    
    func toString() -> String {
        return "User : id -> \(self.id) / userName -> \(self.userName) / mdp -> \(self.password) / email -> \(self.email)"
>>>>>>> database
    }
}
