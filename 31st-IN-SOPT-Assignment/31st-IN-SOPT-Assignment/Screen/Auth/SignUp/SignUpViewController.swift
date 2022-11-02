//
//  SignUpViewController.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/07.
//

import UIKit

import RxCocoa
import RxSwift

final class SignUpViewController: UIViewController {
    
    // MARK: - Property
    
    private let signUpView = SignUpView()
    private let viewModel = SignUpViewModel()
    private let disposBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        setNavigationbarHideen()
        bind()
    }
    
    // MARK: - Bind
    
    private func bind() {
        let input = SignUpViewModel.Input(
            emailDidEdit: signUpView.emailTextField.rx.text.orEmpty.asObservable(),
            passwordDidEdit: signUpView.passwordTextField.rx.text.orEmpty.asObservable(),
            passwrodCheckDidEdit: signUpView.checkpasswordTextField.rx.text.orEmpty.asObservable(),
            signUpTap: signUpView.createButton.rx.tap.asObservable())
        
        let output = viewModel.transform(from: input)
        
        output.goToAuthComplete
            .bind(onNext: { [weak self] _ in
                guard let self = self else { return }
                let authComplete = AuthCompleteViewController()
                authComplete.modalPresentationStyle = .fullScreen
                
                authComplete.setData(string: self.signUpView.emailTextField.text ?? "")
                
                self.present(authComplete, animated: true) {
                self.navigationController?.popToRootViewController(animated: true)
                }
            })
            .disposed(by: disposBag)
        
        output.enableSignUp
            .bind(to: signUpView.createButton.rx.isUserInteractionEnabled)
            .disposed(by: disposBag)
    }
    
    
    // MARK: - Custom Method
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func setNavigationbarHideen() {
        self.navigationController?.isNavigationBarHidden = true
    }
}
