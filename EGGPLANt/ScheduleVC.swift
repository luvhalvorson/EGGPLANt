//
//  ScheduleVC.swift
//  EGGPLANt
//
//  Created by 何玟叡 on 2017/9/8.
//  Copyright © 2017年 FifthGroup. All rights reserved.
//

import UIKit

class ScheduleVC: UIViewController, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var timeLine:[String] = ["00", "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"]
    var weekDay:[WeekDay] = [WeekDay(week:"一", day:"23"), WeekDay(week:"二", day:"24"), WeekDay(week:"三", day:"25"), WeekDay(week:"四", day:"26"), WeekDay(week:"五", day:"27"), WeekDay(week:"六", day:"28"), WeekDay(week:"日", day:"29")]
    var lesson:String = ""
    
    @IBAction func mathBtn(_ sender: Any) {
        lesson = "Math"
    }
    @IBAction func musicBtn(_ sender: Any) {
        lesson = "Music"
    }
    @IBAction func uiBtn(_ sender: Any) {
        lesson = "UI"
    }
    @IBAction func peBtn(_ sender: Any) {
        lesson = "PE"
    }
    @IBAction func appBtn(_ sender: Any) {
        lesson = "App"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeLine.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier:
            "TimeCell")
        if cell == nil {
            cell = UITableViewCell(style:UITableViewCellStyle.default, reuseIdentifier: "TimeCell")
        }
        let timeCell:TimeTVC = cell as! TimeTVC
        timeCell.cellLb.text = timeLine[indexPath.row]
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weekDay.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeekDayCVC", for: indexPath)
        let weekDayCell:WeekDayCVC = cell as! WeekDayCVC
        
        weekDayCell.dayLb.text = weekDay[indexPath.row].day
        weekDayCell.weekLb.text = weekDay[indexPath.row].week
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print(segue.destination) //檢查是否成功到達目的地
        let lessonCell:LessonDetailVC = segue.destination as! LessonDetailVC
        lessonCell.lessonName = lesson
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        self.tabBarController?.tabBar.isHidden = false
        // Do any additional setup after loading the view.
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
