//
//  ResultState.swift
//  lumos
//
//  Created by Owen Ancelot on 03/03/2024.
//

import Foundation

class ResultState<T> {
    let status: Status
    let result: T?
    let error: String?
    
    private init(status: Status, result: T?, error: String?) {
        self.status = status
        self.result = result
        self.error = error
    }
    
    static func onLoading() -> ResultState<T> {
        return ResultState<T>(status: Status.loading, result: nil, error: nil)
    }
    
    static func onSuccess(_ result: T) -> ResultState<T> {
        return ResultState(status: Status.success, result: result, error: nil)
    }
    
    static func onError(_ error: String) -> ResultState<T> {
        return ResultState(status: Status.failure, result: nil, error: error)
    }
}
