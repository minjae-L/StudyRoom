//
//  ViewController.swift
//  studyroom
//
//  Created by 이민재 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblCurrentTime: UILabel!
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
//    let getTime: Selector = #selector(ViewController.calculateTime)
    let interval = 1.0
    
    var name : String?
    
    @objc func updateTime() {
        let date = Date()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        lblCurrentTime.text = formatter.string(from: date)
    }
    
    
    func setUserInfo() {
        name = "이민재"
        lblName.text = name
    }
    
    override func viewDidLoad() {
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        super.viewDidLoad()
        
        
        setUserInfo()
    }
    
}

