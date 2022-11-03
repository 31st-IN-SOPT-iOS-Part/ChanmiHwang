//
//  ViewModel.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/02.
//

import Foundation

import RxSwift

protocol ViewModel {

    associatedtype Input
    associatedtype Output

    var disposeBag: DisposeBag { get set }

    func transform(from input: Input) -> Output
    
}
