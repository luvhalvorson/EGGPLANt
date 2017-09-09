//
//  LessonDetailVC.swift
//  EGGPLANt
//
//  Created by 何玟叡 on 2017/9/9.
//  Copyright © 2017年 FifthGroup. All rights reserved.
//

import UIKit

class LessonDetailVC: UIViewController {

    var lessonName:String = ""
    var noticeBool:Bool = false
    
    @IBOutlet weak var noticeImg: UIImageView!
    
    @IBAction func home(segue:UIStoryboardSegue){
        print("unwind \(segue.destination)")
        let noticeCell:NoticeVC = segue.source as! NoticeVC
        noticeBool = noticeCell.noticeSet.bool(forKey: "noticeBool")
        setAlarmImg(setReady: noticeBool)
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = lessonName
        self.tabBarController?.tabBar.isHidden = true
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        setAlarmImg(setReady: noticeBool)
        print(noticeBool)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setAlarmImg(setReady: Bool){
        if setReady == true {
            noticeImg.image = UIImage(named: "LessonInfo_alarmed")
        }else {
            noticeImg.image = UIImage(named: "LessonInfo_alarm")
        }
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
