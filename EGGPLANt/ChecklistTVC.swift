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
    
    @IBAction func checkbox(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        if let _ = delegate {
            delegate?.btnChecked(cell:self)
        }
        
    }
}

class ChecklistTVC: UITableViewController, ChecklistDelegate {
    
    var checklistItems:[ChecklistItem] = []
    
    func btnChecked(cell: ChecklistTVCell) {
        let indexPath = self.tableView.indexPath(for: cell)
        print(indexPath!.row)
        
        checklistItems.remove(at: indexPath!.row)
        tv.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return checklistItems.count
    }
    
    
    @IBOutlet weak var titleLb: UILabel!
    @IBOutlet weak var locationLb: UILabel!
    @IBOutlet weak var annotationLb: UILabel!
    
    @IBOutlet var tv: UITableView!
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ChecklistTVCell? = tableView.dequeueReusableCell(withIdentifier: "Cell") as?ChecklistTVCell
        cell?.delegate = self
        /*cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "Cell")*/
        
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
        else {
            cell?.boxImage?.image = UIImage(named: "box")
        }
        
        return cell!
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
}
