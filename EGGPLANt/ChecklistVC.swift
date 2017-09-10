//
//  ChecklistTVC.swift
//  EGGPLANt
//
//  Created by YiChin Lee on 09/09/2017.
//  Copyright © 2017 FifthGroup. All rights reserved.
//


import UIKit

protocol ChecklistDelegate {
    func btnChecked(cell: ChecklistTVCell)
}

class ChecklistTVCell: UITableViewCell {
    var delegate:ChecklistDelegate?
    
    @IBOutlet weak var titleLb: UILabel!
    
    @IBOutlet weak var locationLb: UILabel!
    
    @IBOutlet weak var annotationLb: UILabel!
    @IBOutlet weak var typeImage: UIImageView!
    @IBOutlet weak var dateImage: UIImageView!
    
    @IBOutlet weak var dateLb: UILabel!
    
    @IBOutlet weak var timeLb: UILabel!
    
    @IBOutlet weak var boxImage: UIImageView!
    
    @IBOutlet weak var checkbox: UIButton!
    @IBAction func checkbox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if let _ = delegate {
            delegate?.btnChecked(cell:self)
        }
        
    }
}

class ChecklistVC: UIViewController, ChecklistDelegate, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var subview: UIView!
    @IBAction func okbtn(_ sender: UIButton) {
        subview.isHidden = true
    }
    
    var checklistItems:[ChecklistItem] = []
    
    func btnChecked(cell: ChecklistTVCell) {
        // Pop up gain experience window
        subview.isHidden = false
        let when = DispatchTime.now() + 0.5 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            let indexPath = self.tableView.indexPath(for: cell)
            self.checklistItems.remove(at: indexPath!.row)
            print("remove")
            // Put inside this block to reload after removing items
            // 不要放外面因為reload時還沒remove
            self.tableView.reloadData()
        }
        
        print("reload")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        subview.isHidden = true
        
        checklistItems = [
            ChecklistItem(title:"面交"
                ,type:0
                ,location:"師大"
                ,annotation:"攜帶零錢"
                ,done:false
                ,date:"0823"
                ,time:"18:00"
                ,bell:true),
            ChecklistItem(title:"跳舞"
                ,type:0
                ,location:"中山地下街"
                ,annotation:"攜帶毛巾及音響"
                ,done:false
                ,date:"0823"
                ,time:"18:00"
                ,bell:false),
            ChecklistItem(title:"數學題本A"
                ,type:1
                ,location:"Home"
                ,annotation:"23:00前上傳"
                ,done:false
                ,date:"0823"
                ,time:"20:00"
                ,bell:true
            )
        ]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklistItems.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ChecklistTVCell? = tableView.dequeueReusableCell(withIdentifier: "Cell") as?ChecklistTVCell
        cell?.delegate = self
        
        // Make sure the reused cell has been all unselected
        cell?.checkbox.isSelected = false
        
        cell?.titleLb?.text = checklistItems[indexPath.row].title
        cell?.locationLb?.text = "@ \(checklistItems[indexPath.row].location)"
        cell?.annotationLb?.text = "備註：\(checklistItems[indexPath.row].annotation)"
        cell?.dateLb?.text = checklistItems[indexPath.row].date
        cell?.timeLb?.text = checklistItems[indexPath.row].time
        
        cell?.typeImage?.frame.origin.x = CGFloat(117 + 20 * (checklistItems[indexPath.row].title.count) + 7)
        
        // Choose the color of dot based on event type
        let type = checklistItems[indexPath.row].type
        
        if type == 0 {
            cell?.typeImage?.image = UIImage(named: "yellowspot")
        }
        else if type == 1 {
            cell?.typeImage?.image = UIImage(named: "pinkspot")
            
        }
        // See if the event has notification
        let bell = checklistItems[indexPath.row].bell
        
        if bell {
            cell?.dateImage?.image = UIImage(named: "squareColoredbell")
        }
        else {
            cell?.dateImage?.image = UIImage(named: "2SquareUncoloredbell")
        }
        
        // See if the event is done
        let done = checklistItems[indexPath.row].done
        
        if done {
            cell?.boxImage?.image = UIImage(named: "boxwtick")
        }
        else if !done {
            cell?.boxImage?.image = UIImage(named: "box")
        }
        else{
            print("what?!")
        }
        
        return cell!
    }
    
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
}



