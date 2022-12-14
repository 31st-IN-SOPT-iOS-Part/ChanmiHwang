//
//  LoginViewModel.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/01.
//

import Foundation

import RxSwift
import RxRelay

final class LoginViewModel: ViewModel {
    
    var disposeBag = DisposeBag()
    
    struct Input {
        let emailDidEdit: Observable<String>
        let passwordDidEdit: Observable<String>
        let loginTap: Observable<Void>
        let signUpTap: Observable<Void>
    }

    struct Output {
        let enableLogin = PublishRelay<Bool>()
        let goToSignUp = PublishRelay<Bool>()
        let goToAuthComplete = PublishRelay<Bool>()
    }
    
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.loginTap
            .bind(onNext: {
                output.goToAuthComplete.accept(true)
            })
            .disposed(by: disposeBag)
        
        input.signUpTap
            .bind(onNext: {
                output.goToSignUp.accept(true)
            })
            .disposed(by: disposeBag)
        
        Observable.combineLatest(input.emailDidEdit, input.passwordDidEdit)
            .map { !$0.0.isEmpty && !$0.1.isEmpty }
            .bind(to: output.enableLogin)
            .disposed(by: disposeBag)
    
        return output
    }
}
