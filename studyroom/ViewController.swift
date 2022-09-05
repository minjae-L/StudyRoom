//
//  ViewController.swift
//  studyroom
//
//  Created by 이민재 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController, timeProtocol {
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUseState: UILabel!
    @IBOutlet weak var lblMyTime: UILabel!
    
    @IBOutlet weak var btnCheckDesk: UIButton!
    @IBOutlet weak var btnUse: UIButton!
    @IBOutlet weak var btnCharge: UIButton!
    
    var isUsing = false
    var myTime: Int = 0
    
    func setBtnTitle () {
        btnCheckDesk.setTitle("좌석확인", for: .normal)
        btnUse.setTitle("이용하기", for: .normal)
        btnCharge.setTitle("충전하기", for: .normal)
    }
    
    func calcTime() {
        var time = myTime
        
        let hour = time / 3600
        let minute = (time - (3600 * hour)) / 60
        
        lblMyTime.text = "잔여시간: \(hour)시간 \(minute)분 "
    }
    
    func dataSend(data: Int) {
        myTime += data
    }
    
    @IBAction func moveChageVc(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChargeViewController") as? ChargeViewController else { return }
        nextVC.delegate = self
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    

//    let timeSelector: Selector = #selector(ViewController.updateTime)
////    let getTime: Selector = #selector(ViewController.calculateTime)
//    let interval = 1.0
//
//    var time = 3600
//
//    var name : String?
//
//    @objc func updateTime() {
//        let date = Date()
//        let formatter = DateFormatter()
//
//        formatter.dateFormat = "yyyy-MM-dd HH:mm"
//        lblCurrentTime.text = formatter.string(from: date)
//    }
//
//
//    func setUserInfo() {
//        name = "이민재"
//        lblName.text = name
//    }
    
    override func viewDidLoad() {
//        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        super.viewDidLoad()
        lblUserName.text = "이민재 님"
        setBtnTitle()
        
//        setUserInfo()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        calcTime()
        if isUsing {
            lblUseState.textColor = .green
            lblUseState.text = "이용중입니다."
            
        } else {
            lblUseState.textColor = .red
            lblUseState.text = "이용중이 아닙니다."
            
        }
    }
    

}

