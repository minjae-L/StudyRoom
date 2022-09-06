//
//  ChargeViewController.swift
//  studyroom
//
//  Created by 이민재 on 2022/08/23.
//

import UIKit

protocol timeProtocol {
    func dataSend(data: Int)
}

class ChargeViewController: UIViewController,UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var lblSelected: UILabel!
    @IBOutlet weak var btnCharge: UIButton!
    var hour : Int = 0
    
    var delegate: timeProtocol?
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return MAX_PICKER_COMPONENT
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MAX_PICKER_NUMBER
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let label = timeArray[row]
        
        return label
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 0 {
            lblSelected.text = "선택된 시간: "
        } else {
            lblSelected.text = "선택된 시간: \(row) 시간"
            hour = row
        }
    }
    
    let MAX_PICKER_COMPONENT = 1
    let MAX_PICKER_NUMBER = 6
    @IBOutlet weak var pvChargeTime: UIPickerView!
    var timeArray = ["선택", "1시간", "2시간", "3시간", "4시간", "5시간"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "충전하기"
        lblSelected.text = "선택된 시간:"
        btnCharge.setTitle("충전하기", for: .normal)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnCharge(_ sender: UIButton) {
        let selectedHours = hour * 3600
        print(selectedHours)
        delegate?.dataSend(data: selectedHours)
        
        self.navigationController?.popViewController(animated: true)
    }
    
}
