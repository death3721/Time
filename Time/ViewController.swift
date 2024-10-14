//
//  ViewController.swift
//  Time
//
//  Created by death3721 on 2024/10/14.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var table: UITableView!
    
    var dataArray = Array<Any>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.table.delegate = self
        self.table.dataSource = self
    }
    
    @IBAction func checkButtonClick(_ sender: UIButton) {
        guard inputTextField.text != "" && startTimeTextField.text != "" && endTimeTextField.text != "" else {
            print("Empty input")
            return
        }
        
        if let inputTime = Int(inputTextField.text!), let startTime = Int(startTimeTextField.text!),  let endTime = Int(endTimeTextField.text!) {
            let result = Function().isInTimeRange(inputTime: inputTime, startTime: startTime, endTime: endTime)
            // 開始時刻、終了時刻、ある時刻と判断結果
            print("開始時刻: \(startTime) 終了時刻: \(endTime) ある時刻: \(inputTime) 判断結果: \(result)")
        } else {
            print("Error")
        }
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataArray.count
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.selectionStyle = .none
        
        var cc = cell.defaultContentConfiguration()
        cc.text = "開始時刻: 1 終了時刻: 3 ある時刻: 2 判断結果: true"
        cell.contentConfiguration = cc
        
        return cell
    }
}
