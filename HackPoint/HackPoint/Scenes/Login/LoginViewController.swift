//
//  LoginViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var token: String?
    var referee: DTOReferee?
    
    var progressHUD: ProgressHUD!
    var subView: UIView!
    
    @IBOutlet private weak var loginTextField: TextField!
    @IBOutlet private weak var passwordTextField: TextField!
    @IBOutlet private weak var errorLabel: UILabel!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action:#selector(LoginViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        loginTextField.delegate = self
        passwordTextField.delegate = self
        
        loginTextField.tag = 0
        passwordTextField.tag = 1
        errorLabel.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private func switchBasedNextTextField(_ textField: UITextField) {
        switch textField {
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            passwordTextField.resignFirstResponder()
        }
    }
    
    @objc func keyboardWillShow(notification:NSNotification) {
        
        guard let userInfo = notification.userInfo else { return }
        var keyboardFrame:CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyboardFrame = self.view.convert(keyboardFrame, from: nil)
        
        var contentInset:UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyboardFrame.size.height + 90
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification:NSNotification) {
        let contentInset:UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        validation()
    }
    
    @IBAction func startEditing(_ sender: TextField) {
        sender.borderInactiveColor = .systemGray5
    }
    
    @discardableResult
    private func validation() -> Bool {
        guard let loginStr = loginTextField.text, let passwordStr = passwordTextField.text else { return false }
        if loginStr.isEmpty || passwordStr.isEmpty {
            errorLabel.isHidden = false
            loginTextField.borderInactiveColor = .red
            passwordTextField.borderInactiveColor = .red
            return false
        } else {
            errorLabel.isHidden = true
            loginTextField.borderInactiveColor = .systemGray5
            passwordTextField.borderInactiveColor = .systemGray5
            login(login: loginStr, password: passwordStr)
            return true
        }
    }
    
    func login(login: String, password: String) {
        showProgressHUD()
        APIClient.shared.login(login: login, password: password) { [weak self] result in
            switch result {
            case .success(let result):
                self?.token = result.token
                self?.referee = result.referee
                
                self?.hideProgressHUD()
                
                let defaults = UserDefaults.standard
                defaults.set(self?.token, forKey: "Token")
                self?.errorLabel.isHidden = true
                self?.coordinator?.openHomeScreen(referee: self?.referee)
            case .failure(let error):
                let alert = UIAlertController(title: "Ошибка валидации", message: "Повторите ввод логина и паролья", preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "ОК", style: UIAlertAction.Style.default, handler: nil))
                self!.present(alert, animated: true, completion: nil)
                self?.errorLabel.isHidden = false
                self?.hideProgressHUD()
                print(error.localizedDescription)
            }
        }
    }
    
    func showProgressHUD(on view: UIView? = nil) {
        let view: UIView! = view ?? self.view
        subView = UIView(frame: view.frame)
        subView.backgroundColor = UIColor(white: 0, alpha: 0.4)
        progressHUD = ProgressHUD(text: "Загрузка...")
        view.addSubview(subView)
        subView.addSubview(self.progressHUD)
    }
    
    func hideProgressHUD() {
        UIView.animate(withDuration: 0.3) {
            self.progressHUD.alpha = 0
            self.subView.alpha = 0
        } completion: { _ in
            self.subView.removeFromSuperview()
        }
    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
    
    
}
