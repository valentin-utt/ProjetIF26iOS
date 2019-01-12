//
//  AddCacheViewController.swift
//  ProjetIF26
//
//  Created by Vincent on 11/01/2019.
//  Copyright © 2019 GUILLOUX Valentin. All rights reserved.
//

import UIKit

class AddCacheViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var pickerDifficulty: UIPickerView!
    @IBOutlet weak var pickerType: UIPickerView!
    @IBOutlet weak var pickerTerrain: UIPickerView!
    
    @IBOutlet weak var tailleTextField: UITextField!
    @IBOutlet weak var indiceTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    

    var cache:Cache = Cache(lat: 0, lon: 0, type: 1, difficulty: 1, terrain: 1, size: 1, owner: 1, hint: "", description: "")
    let cacheDAO:CacheDAO = CacheDAO()
    
    var lat:Double = 0
    var lon:Double = 0
    
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
        
        cache.setLat(lat: lat)
        cache.setLon(lon: lon)
        
    }
    
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
        if pickerView == pickerDifficulty {
            cache.setDifficulty(difficulty: row+1)
        } else if pickerView == pickerType {
            cache.setType(type: row+1)
        } else if pickerView == pickerTerrain {
            cache.setTerrain(terrain: row+1)
        }
        print("row: \(row) / pickerView: \(pickerView)")
    }
    
    
    @IBAction func ajoutCache() {
        let taille = Int(tailleTextField.text ?? "1")
        let hint = indiceTextField.text
        let description = descriptionTextField.text
        cache.setSize(size: taille ?? 1)
        cache.setHint(hint: hint ?? "")
        cache.setDescription(description: description ?? "")
        
        cacheDAO.insert(cache: cache)
        
        let arrayCache = cacheDAO.getAllCache()
        for cache in arrayCache {
            print(cache.toString())
        }
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
