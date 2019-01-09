//
//  ViewController.swift
//  ProjetIF26
//
//  Created by GUILLOUX Valentin on 30/11/2018.
//  Copyright © 2018 GUILLOUX Valentin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let userDAO:UserDAO = UserDAO()
        let user:User = User(email: "testmail", password: "pass", userName: "pseudo")
        userDAO.insert(user: user)
        let user1=userDAO.getUserById(id: 1)
        print(user1!.toString())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

