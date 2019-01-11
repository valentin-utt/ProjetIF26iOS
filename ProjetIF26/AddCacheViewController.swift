//
//  AddCacheViewController.swift
//  ProjetIF26
//
//  Created by Vincent on 11/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import UIKit

class AddCacheViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (pickerView == pickerDifficulty) {
            return pickerDataDifficulty.count
        } else if (pickerView == pickerType) {
            return pickerDataType.count
        } else if pickerView == pickerTerrain {
            return pickerDataTerrain.count
        }else {
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickerDifficulty {
            return pickerDataDifficulty[row]
        } else if pickerView == pickerType {
            return pickerDataType[row]
        } else if pickerView == pickerTerrain {
            return pickerDataTerrain[row]
        } else {
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("row: \(row) / component: \(component)")
    }
    

    @IBOutlet weak var pickerDifficulty: UIPickerView!
    @IBOutlet weak var pickerType: UIPickerView!
    @IBOutlet weak var pickerTerrain: UIPickerView!
    
    var pickerDataDifficulty: [String] = [String]()
    var pickerDataType: [String] = [String]()
    var pickerDataTerrain: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.pickerDifficulty.delegate = self
        self.pickerDifficulty.dataSource = self
        self.pickerType.delegate = self
        self.pickerType.dataSource = self
        self.pickerTerrain.delegate = self
        self.pickerTerrain.dataSource = self
        
        pickerDataDifficulty = ["Facile","Moyen","Difficile"]
        pickerDataType = ["Boite","Valise","Trésor"]
        pickerDataTerrain = ["Dur","Sable","Terre"]
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
