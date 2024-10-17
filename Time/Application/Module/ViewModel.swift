//
//  Function.swift
//  Time
//
//  Created by death3721 on 2024/10/14.
//

class ViewModel {
    var dataArray = Array<String>()
    
    init(dataArray: Array<String>) {
        self.dataArray = dataArray
    }
    
    func isInTimeRange(inputTime: Int, startTime: Int, endTime: Int) -> Bool {
        if startTime < endTime { // in one day
            if( inputTime >= startTime && inputTime < endTime) {
                return true
            } else {
                return false
            }
        } else { // till next day
            if( inputTime >= startTime || inputTime < endTime) {
                return true
            } else {
                return false
            }
        }
    }
}
