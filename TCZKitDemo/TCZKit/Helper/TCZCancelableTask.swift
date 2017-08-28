//
//  TCZCancelableTask.swift
//  Dormouse
//
//  Created by 武卓 on 2017/8/23.
//  Copyright © 2017年 WangSuyan. All rights reserved.
//

import Foundation

public typealias CancelableTask = (_ cancel: Bool) -> Void

/// 延迟
public func delay(time: TimeInterval, work: @escaping ()->()) -> CancelableTask? {
    
    var finalTask: CancelableTask?
    
    let cancelableTask: CancelableTask = { cancel in
        if cancel {
            finalTask = nil // key
            
        } else {
            DispatchQueue.main.async(execute: work)
        }
    }
    
    finalTask = cancelableTask
    
    DispatchQueue.main.asyncAfter(deadline: .now() + time) {
        if let task = finalTask {
            task(false)
        }
    }

    
    return finalTask
}

public func cancel(cancelableTask: CancelableTask?) {
    cancelableTask?(true)
}
