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
    
//    var dataArray = Array<String>()
    private var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.table.delegate = self
        self.table.dataSource = self
        
        if let data = UserDefaults().object(forKey: "RESULT") {
            let tempDataArray = data as! [String]
            viewModel = ViewModel(dataArray: tempDataArray)
        }
    }
    
    @IBAction func checkButtonClick(_ sender: UIButton) {
        guard inputTextField.text != "" && startTimeTextField.text != "" && endTimeTextField.text != "" else {
            print("Empty input")
            return
        }
        
        if let inputTime = Int(inputTextField.text!), let startTime = Int(startTimeTextField.text!),  let endTime = Int(endTimeTextField.text!) {
            
            let result = viewModel.isInTimeRange(inputTime: inputTime, startTime: startTime, endTime: endTime)
            let saveString = "開始時刻: \(startTime) 終了時刻: \(endTime) ある時刻: \(inputTime) 判断結果: \(result)"
            
            print("開始時刻: \(startTime) 終了時刻: \(endTime) ある時刻: \(inputTime) 判断結果: \(result)")
            
            if let data = UserDefaults().object(forKey: "RESULT") {
                viewModel.dataArray = data as! [String]
                viewModel.dataArray.append(saveString)
                UserDefaults().set(viewModel.dataArray, forKey: "RESULT")
                table.reloadData()
            } else {
                viewModel.dataArray.append(saveString)
                UserDefaults().set(viewModel.dataArray, forKey: "RESULT")
                table.reloadData()
            }
            
        } else {
            print("Error")
        }
    }
}

extension ViewController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.selectionStyle = .none
        
        var cc = cell.defaultContentConfiguration()
        cc.text = viewModel.dataArray[indexPath.row]
        cell.contentConfiguration = cc
        
        return cell
    }
}
