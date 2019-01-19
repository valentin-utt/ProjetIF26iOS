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
            UserDefaults.standard.set(true, forKey: "FilterType1")
            print(UserDefaults.standard.bool(forKey: "FilterType1"))
        }
        else{
            UserDefaults.standard.set(false, forKey: "FilterType1")
            print(UserDefaults.standard.bool(forKey: "FilterType1"))
        }
    }
    
    
    @IBAction func type2ChangedValue(_ sender: UISwitch) {
        if (sender.isOn){
            UserDefaults.standard.set(true, forKey: "FilterType2")
            print(UserDefaults.standard.bool(forKey: "FilterType2"))
        }
        else{
            UserDefaults.standard.set(false, forKey: "FilterType2")
            print(UserDefaults.standard.bool(forKey: "FilterType2"))
        }
    }

    

    
    @IBAction func switch3changeValue(_ sender: UISwitch) {
        if (sender.isOn){
            UserDefaults.standard.set(true, forKey: "FilterType3")
            print(UserDefaults.standard.bool(forKey: "FilterType3"))
        }
        else{
            UserDefaults.standard.set(false, forKey: "FilterType3")
            print(UserDefaults.standard.bool(forKey: "FilterType3"))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("users bool: \(UserDefaults.standard.bool(forKey: "FilterType1")) \(UserDefaults.standard.bool(forKey: "FilterType2")) \(UserDefaults.standard.bool(forKey: "FilterType3"))")
        self.switchType1.setOn(UserDefaults.standard.bool(forKey: "FilterType1"), animated: false)
        self.switchType2.setOn(UserDefaults.standard.bool(forKey: "FilterType2"), animated: false)
        self.switchType3.setOn(UserDefaults.standard.bool(forKey: "FilterType3"), animated: false)
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
