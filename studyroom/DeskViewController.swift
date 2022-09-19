//
//  DeskViewController.swift
//  studyroom
//
//  Created by 이민재 on 2022/09/06.
//

import UIKit

protocol UseStateProtocol {
    func sentUseState(data: Bool, deskNum: Int)
}

class DeskViewController: UIViewController {

    var deskArr: [Bool] = [false, true, false, false, true, false, true, true]
    
    
    
    @IBOutlet weak var desk1: UIButton!
    @IBOutlet weak var desk2: UIButton!
    @IBOutlet weak var desk3: UIButton!
    @IBOutlet weak var desk4: UIButton!
    @IBOutlet weak var desk5: UIButton!
    @IBOutlet weak var desk6: UIButton!
    @IBOutlet weak var desk7: UIButton!
    @IBOutlet weak var desk8: UIButton!
    
    var delegate: UseStateProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "좌석확인"
        setDesk()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setDesk()
    }
    
    func setDesk () {
        var buttons = [desk1, desk2, desk3, desk4, desk5, desk6, desk7, desk8]
        for i in 0..<deskArr.count {
            buttons[i]?.tag = i
            if deskArr[i] {
                buttons[i]?.backgroundColor = .red
                buttons[i]?.isEnabled = false
            } else {
                buttons[i]?.backgroundColor = .green
                buttons[i]?.isEnabled = true
            }
        }
    }

    @IBAction func desk(_ sender: UIButton) {
        
        let deskNum = sender.tag + 1
        
        let alert = UIAlertController(title: "좌석 \(deskNum)번", message: "이용 하시겠습니까?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "예", style: UIAlertAction.Style.default, handler: { _ in
            self.delegate?.sentUseState(data: true, deskNum: deskNum)
            self.navigationController?.popViewController(animated: true)
            print("use")
        })
        let noAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(yesAction)
        alert.addAction(noAction)
        present(alert, animated: true, completion: nil)
    }
    
}
