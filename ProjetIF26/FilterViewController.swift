//
//  FilterViewController.swift
//  ProjetIF26
//
//  Created by oui on 12/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    

    @IBOutlet weak var switchType1: UISwitch!
    
    @IBOutlet weak var switchType2: UISwitch!
    
    @IBOutlet weak var switchType3: UISwitch!
    
 
    @IBAction func type1ChangedValue(_ sender: UISwitch) {
        if (sender.isOn){
            UserDefaults.standard.set(false, forKey: "FilterType1")
            print(UserDefaults.standard.bool(forKey: "FilterType1"))
        }
        else{
            UserDefaults.standard.set(true, forKey: "FilterType1")
            print(UserDefaults.standard.bool(forKey: "FilterType1"))
        }
    }
    
    
    @IBAction func type2ChangedValue(_ sender: UISwitch) {
        if (sender.isOn){
            UserDefaults.standard.set(false, forKey: "FilterType2")
            print(UserDefaults.standard.bool(forKey: "FilterType2"))
        }
        else{
            UserDefaults.standard.set(true, forKey: "FilterType2")
            print(UserDefaults.standard.bool(forKey: "FilterType2"))
        }
    }

    

    
    @IBAction func switch3changeValue(_ sender: UISwitch) {
        if (sender.isOn){
            UserDefaults.standard.set(false, forKey: "FilterType2")
            print(UserDefaults.standard.bool(forKey: "FilterType2"))
        }
        else{
            UserDefaults.standard.set(true, forKey: "FilterType2")
            print(UserDefaults.standard.bool(forKey: "FilterType2"))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
