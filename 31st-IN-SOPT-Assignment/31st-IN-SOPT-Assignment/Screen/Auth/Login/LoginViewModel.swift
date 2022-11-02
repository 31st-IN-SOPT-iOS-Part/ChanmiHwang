//
//  LoginViewModel.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/11/01.
//

import Foundation

import RxCocoa
import RxSwift

final class LoginViewModel: ViewModel {
    
    var disposeBag = DisposeBag()
    
    // 아이디, 비밀번호 텍스트 필드 입력, 로그인, 회원가입 버튼 클릭 후 화면 전환
    struct Input {
        let emailDidEdit: Observable<String>
        let passwordDidEdit: Observable<String>
        let loginTap: Observable<Void>
        let signUpTap: Observable<Void>
    }
    
    // 버튼 활성화
    struct Output {
        let enableLogin = PublishRelay<Bool>()
        let goToSignUp = PublishRelay<Bool>()
    }
    
    func transform(from input: Input) -> Output {
        let output = Output()
        
        Observable.combineLatest(input.emailDidEdit, input.passwordDidEdit)
            .map { !$0.0.isEmpty && !$0.1.isEmpty }
            .bind(to: output.enableLogin)
            .disposed(by: disposeBag)
    
        return output
    }
}
