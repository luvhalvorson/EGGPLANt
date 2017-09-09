//
//  ChecklistItem.swift
//  EGGPLANt
//
//  Created by YiChin Lee on 09/09/2017.
//  Copyright © 2017 FifthGroup. All rights reserved.
//

import Foundation
struct ChecklistItem {
    var title:String = ""
    // 0 is yellow, 1 is red
    var type:Int = 0
    var location:String = ""
    var annotation:String = ""
    var done:Bool = false
    var date:String = ""
    var time:String = ""
    var bell:Bool = false
}
