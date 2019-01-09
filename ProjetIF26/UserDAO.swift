//
//  UserDAO.swift
//  ProjetIF26
//
//  Created by Vincent on 08/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import UIKit
import SQLite

class UserDAO: DataBaseController {

    override init() {
        super.init()
        super.createTables()
    }
    
    func insert(user: User) {
        do {
            try super.database.run(super.user_table.insert(DataBaseController.user_email <- user.getEmail(), DataBaseController.user_password <- user.getPassword(), DataBaseController.user_name <- user.getUserName()))
        } catch {
            print("insert user failed : \(error)")
        }
    }
    
    private func getUser(query: Table) -> User? {
        var user: User
        do {
            for row in try super.database.prepare(query) {
                user = User.init(id: row[DataBaseController.user_id], email: row[DataBaseController.user_email], password: row[DataBaseController.user_password], userName: row[DataBaseController.user_name])
                return user
            }
        } catch {
            print("get user failed : \(error)")
        }
        return nil
        
    }
    
    func getUserById(id: Int) -> User? {
        let query = super.user_table.filter(DataBaseController.user_id == id)
        let user = self.getUser(query: query)
        return user
    }

}
