//
//  CreateEventVC.swift
//  EGGPLANt
//
//  Created by YiChin Lee on 10/09/2017.
//  Copyright © 2017 FifthGroup. All rights reserved.
//

import UIKit

class CreateEventVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // These strings are for the titles of each row in pickerView
    
    var alertString = ["None", "At time of event","30 mins before","1 day before","1 week before"]
    
    var repeatString = ["Never", "Every day","Every week","Every month","Every year"]
    
    @IBOutlet weak var alertTF: RoundCornerTf!
    @IBOutlet weak var alertPV: UIPickerView!
    @IBOutlet weak var repeatPV: UIPickerView!
    
    @IBAction func alertBtn(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if sender.isSelected {
            alertPV.isHidden = false
        }
        else {
            alertPV.isHidden = true
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 120
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 26
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
        
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == alertPV {
            return alertString.count
        } else {
            
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        
        if pickerView == alertPV {
            
            let titleData = alertString[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 16.0)!,NSAttributedStringKey.foregroundColor:UIColor.black])
            pickerLabel.attributedText = myTitle
            
        } else if pickerView == repeatPV {
            let titleData = repeatString[row]
            let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Georgia", size: 16.0)!,NSAttributedStringKey.foregroundColor:UIColor.black])
            pickerLabel.attributedText = myTitle
        }
        pickerLabel.backgroundColor = UIColor.white
        return pickerLabel
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.alertTF.text = self.alertString[row]
        self.alertPV.isHidden = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        alertPV.isHidden = true
        repeatPV.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}
