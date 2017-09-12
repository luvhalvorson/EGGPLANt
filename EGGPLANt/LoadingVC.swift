//
//  LoadingVC.swift
//  EGGPLANt
//
//  Created by YiChin Lee on 06/09/2017.
//  Copyright © 2017 FifthGroup. All rights reserved.
//

import UIKit

class LoadingVC: UIViewController {

    @IBOutlet weak var loadImg1: UIImageView!
    @IBOutlet weak var loadImg2: UIImageView!
    @IBOutlet weak var loadImg3: UIImageView!
    @IBOutlet weak var loadImg4: UIImageView!
    @IBOutlet weak var loadImg5: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateImg(imgView: loadImg1, duration: 1.5)
        Timer.scheduledTimer(withTimeInterval: 0.3, repeats: false) { (_) in
            self.animateImg(imgView: self.loadImg2, duration: 1.5)
        }
        Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { (_) in
            self.animateImg(imgView: self.loadImg3, duration: 1.5)
        }
        Timer.scheduledTimer(withTimeInterval: 0.9, repeats: false) { (_) in
            self.animateImg(imgView: self.loadImg4, duration: 1.5)
        }
        Timer.scheduledTimer(withTimeInterval: 1.2, repeats: false) { (_) in
            self.animateImg(imgView: self.loadImg5, duration: 1.5)
        }
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (_) in
            let nextVC:UIViewController = (self.storyboard?.instantiateViewController(withIdentifier: "FirstEggVC"))!
            self.present(nextVC, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateImg(imgView: UIImageView, duration: Double){
        imgView.animationImages = [UIImage(named: "Loading")!, UIImage(named: "Loaded")!]
        imgView.animationDuration = duration
        imgView.startAnimating()
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
