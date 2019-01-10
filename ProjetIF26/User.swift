

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
    }
}
