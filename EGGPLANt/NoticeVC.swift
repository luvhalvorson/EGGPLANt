//
//  NoticeVC.swift
//  EGGPLANt
//
//  Created by 何玟叡 on 2017/9/9.
//  Copyright © 2017年 FifthGroup. All rights reserved.
//

import UIKit

class NoticeVC: UIViewController {
    
    let noticeSet = UserDefaults.standard
    
    @IBAction func noticeSetFinished(_ sender: Any) {
        noticeSet.set(true, forKey: "noticeBool")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.title = "數學題本A"
        self.tabBarController?.tabBar.isHidden = true
        noticeSet.synchronize()
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
