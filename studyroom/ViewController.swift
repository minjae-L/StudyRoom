//
//  ViewController.swift
//  studyroom
//
//  Created by 이민재 on 2022/08/22.
//

import UIKit

class ViewController: UIViewController, timeProtocol, UseStateProtocol{
    
    @IBOutlet weak var lblUserName: UILabel!
    @IBOutlet weak var lblUseState: UILabel!
    @IBOutlet weak var lblMyTime: UILabel!
    
    @IBOutlet weak var btnCheckDesk: UIButton!
    @IBOutlet weak var btnFinishUse: UIButton!
    @IBOutlet weak var btnCharge: UIButton!
    
    var isUsing = false
    var myTime: Int = 0
    
    // MARK: - funcs
    
    func setBtnTitle () {
        btnCheckDesk.setTitle("좌석확인", for: .normal)
        btnFinishUse.setTitle("이용종료", for: .normal)
        btnCharge.setTitle("충전하기", for: .normal)
    }
    
    func calcTime() {
        var time = myTime
        
        let hour = time / 3600
        let minute = (time - (3600 * hour)) / 60
        
        lblMyTime.text = "잔여시간: \(hour)시간 \(minute)분 "
    }
    
    func checkUsing(data: Bool) {
        if data {
            lblUseState.textColor = .green
            lblUseState.text = "이용중입니다."
            btnFinishUse.isEnabled = true
            btnCheckDesk.isEnabled = false
        } else {
            lblUseState.textColor = .red
            lblUseState.text = "이용중이 아닙니다."
            btnFinishUse.isEnabled = false
            btnCheckDesk.isEnabled = true
        }
    }
    // MARK: - protocol func
    
    func dataSend(data: Int) {
        myTime += data
    }
    
    func sentUseState(data: Bool) {
        isUsing = data
    }
    
    // MARK: - btn Action
    
    @IBAction func moveChageVc(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "ChargeViewController") as? ChargeViewController else { return }
        nextVC.delegate = self
        
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func moveDeskVC(_ sender: UIButton) {
        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "DeskViewController") as? DeskViewController else { return }
        nextVC.delegate = self
        
        let time = myTime
        
        if time >= 1800 {
            self.navigationController?.pushViewController(nextVC, animated: true)
            
        } else {
            let alert = UIAlertController(title: "잔여시간", message: "잔여시간이 얼마 남지 않았습니다. 충전후 이용 바랍니다.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "충전하기", style: .default, handler: {
                _ in
                guard let chargeVC = self.storyboard?.instantiateViewController(withIdentifier: "ChargeViewController") as? ChargeViewController else { return }
                chargeVC.delegate = self
                self.navigationController?.pushViewController(chargeVC, animated: true)
            })
            alert.addAction(okAction)
            present(alert, animated: true)
        }
    }
    
    
    @IBAction func finishUsing(_ sender: Any) {
        let alert = UIAlertController(title: "이용종료", message: "이용 종료 하시겠습니까?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: .default, handler: { _ in
            self.checkUsing(data: false)
            self.isUsing = false
        })
        let noAction = UIAlertAction(title: "아니요", style: .default, handler: nil)
        
        alert.addAction(yesAction)
        alert.addAction(noAction)
        
        present(alert, animated: true)
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
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        calcTime()
        checkUsing(data: isUsing)
    }
    

}

