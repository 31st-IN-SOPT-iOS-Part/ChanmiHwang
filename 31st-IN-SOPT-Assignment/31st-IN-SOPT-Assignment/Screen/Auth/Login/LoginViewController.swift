//
//  LoginViewController.swift
//  31st-IN-SOPT-Assignment
//
//  Created by 황찬미 on 2022/10/07.
//

import UIKit

import RxCocoa
import RxSwift

final class LoginViewController: UIViewController {
    
    // MARK: - Property
    
    private let loginView = LoginView()
    private let viewModel = LoginViewModel()
    private let disposeBag = DisposeBag()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackgroundColor()
        bind()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        resetTextField()
    }
    
    // MARK: - Bind
    
    private func bind() {
        let input = LoginViewModel.Input(
            emailDidEdit: loginView.emailTextField.rx.text.orEmpty.asObservable(),
            passwordDidEdit: loginView.passwordTextField.rx.text.orEmpty.asObservable(),
            loginTap: loginView.loginButton.rx.tap.asObservable(),
            signUpTap: loginView.createButton.rx.tap.asObservable()
        )
        
        let output = viewModel.transform(from: input)
        
        output.goToAuthComplete
            .bind(onNext: { [weak self] _ in
                guard let self = self else { return }
                let authCompleteVC = AuthCompleteViewController()
                authCompleteVC.modalPresentationStyle = .fullScreen
                self.login()
//                authCompleteVC.setData(string: self.loginView.emailTextField.text ?? "")
                self.present(authCompleteVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        output.goToSignUp
            .bind(onNext: { [weak self] _ in
                guard let self = self else { return }
                let signUpVC = SignUpViewController()
                self.navigationController?.pushViewController(signUpVC, animated: true)
            })
            .disposed(by: disposeBag)
        
        output.enableLogin
            .bind(to: loginView.loginButton.rx.isUserInteractionEnabled)
            .disposed(by: disposeBag)
    }
    
    // MARK: - Custom Method
    
    private func login() {
        guard let email = loginView.emailTextField.text else { return }
        guard let password = loginView.passwordTextField.text else { return }
        
        LoginAPI.shared.login(param: LoginRequest(
            emailOrContact: email,
            password: password)) { response, err in
                print(response)
            }
    }
    
    private func setBackgroundColor() {
        view.backgroundColor = .white
    }
    
    private func resetTextField() {
        loginView.emailTextField.text = ""
        loginView.passwordTextField.text = ""
    }
}
