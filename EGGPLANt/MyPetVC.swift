//
//  MyPetVC.swift
//  EGGPLANt
//
//  Created by YiChin Lee on 11/09/2017.
//  Copyright © 2017 FifthGroup. All rights reserved.
//

import UIKit

class MyPetVC: UIViewController {
    @IBOutlet weak var rightBarBtn: UIBarButtonItem!
    @IBOutlet weak var demoIV: UIImageView!
    @IBOutlet weak var basketPopup: UIView!
    
    @IBOutlet weak var chickPopup: UIView!
    
    @IBOutlet weak var chickIV: UIImageView!
    @IBAction func openBasket(_ sender: UIBarButtonItem) {
        basketPopup.isHidden = false
    }
    
    @IBAction func closeBasket(_ sender: UIButton) {
        basketPopup.isHidden = true
    }
    @IBAction func openChickPopup(_ sender: UIButton) {
        demoIV.isHidden = true
        switch sender.tag {
        case 0:
            chickIV.image = UIImage(named: "lv1ChickenLv4")
            break
        case 1:
        chickIV.image = UIImage(named: "lv2Eggplant")
            break
        case 2:
        chickIV.image = UIImage(named: "lv3Bear")
            break
        default:
            chickIV.image = UIImage(named: "chicklv1")
            return
        }
        basketPopup.isHidden = true
        chickPopup.isHidden = false
    }
    
    @IBAction func closeChickPopup(_ sender: UIButton) {
        demoIV.isHidden = false
        basketPopup.isHidden = false
        chickPopup.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        chickPopup.isHidden = true
        basketPopup.isHidden = true
        rightBarBtn.image = UIImage(named:"basket")?.withRenderingMode(.alwaysOriginal)
        
        
            demoIV.animationImages = [UIImage(named: "eggdemo1")!, UIImage(named: "eggdemo2")!
        , UIImage(named: "eggLv1500")!, UIImage(named: "eggLv1700")!, UIImage(named: "eggLv1800")!, UIImage(named: "eggLv1900")!, UIImage(named: "slice")!]
            demoIV.animationDuration = 2
            demoIV.startAnimating()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
