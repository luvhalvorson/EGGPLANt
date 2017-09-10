//
//  RoundCornerTf.swift
//  EGGPLANt
//
//  Created by YiChin Lee on 10/09/2017.
//  Copyright © 2017 FifthGroup. All rights reserved.
//

import UIKit

class RoundCornerTf: UITextField {

    override func draw(_ rect: CGRect) {
        print("haha")
        
        self.clipsToBounds = true
        self.layer.cornerRadius = 12.0
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.white.cgColor
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.size.width-10, height: bounds.size.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y, width: bounds.size.width-10, height: bounds.size.height)
    }
    

}
