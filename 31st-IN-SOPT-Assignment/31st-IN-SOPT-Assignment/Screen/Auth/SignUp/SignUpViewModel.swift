//
//  SignUpViewModel.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/01.
//

import Foundation

import RxCocoa
import RxSwift
import RxRelay

final class SignUpViewModel: ViewModel {
    
    var disposeBag = DisposeBag()
    
    struct Input {
        let emailDidEdit: Observable<String>
        let passwordDidEdit: Observable<String>
        let passwrodCheckDidEdit: Observable<String>
        let signUpTap: Observable<Void>
    }
    
    struct Output {
        let enableSignUp = PublishRelay<Bool>()
        let goToAuthComplete = PublishRelay<Bool>()
    }
    
    func transform(from input: Input) -> Output {
        let output = Output()
        
        input.signUpTap
            .subscribe(onNext: {
                output.goToAuthComplete.accept(true)
            })
            .disposed(by: disposeBag)
        
        Observable.combineLatest(input.emailDidEdit, input.passwordDidEdit, input.passwrodCheckDidEdit)
            .map { !$0.0.isEmpty && !$0.1.isEmpty && !$0.2.isEmpty && ($0.1 == $0.2) }
            .bind(to: output.enableSignUp)
            .disposed(by: disposeBag)
        
        return output
    }
}
