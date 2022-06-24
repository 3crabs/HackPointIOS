//
//  RegistrationViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

class RegistrationViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    private var referee = false
    
    @IBOutlet private var nameTextField: TextField!
    @IBOutlet private var sirnameTextField: TextField!
    
    @IBOutlet private var loginTextField: TextField!
    @IBOutlet private var passwordTextField: TextField!
    
    @IBOutlet private var githubTextField: TextField!
    
    @IBOutlet private var refereeView: UIView! {
        didSet {
            refereeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(checkReferee(_:))))
        }
    }
    @IBOutlet private var checkImageView: UIImageView!
    @IBOutlet private weak var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(RegistrationViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
        
        nameTextField.delegate = self
        sirnameTextField.delegate = self
        loginTextField.delegate = self
        passwordTextField.delegate = self
        githubTextField.delegate = self
        
        nameTextField.tag = 0
        sirnameTextField.tag = 1
        loginTextField.tag = 2
        passwordTextField.tag = 3
        githubTextField.tag = 4
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
        case nameTextField:
            sirnameTextField.becomeFirstResponder()
        case sirnameTextField:
            loginTextField.becomeFirstResponder()
        case loginTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            githubTextField.becomeFirstResponder()
        default:
            githubTextField.resignFirstResponder()
        }
    }
    
    @objc
    private func checkReferee(_ sender: UIView) {
        referee.toggle()
        checkImageView.image = referee ? UIImage(named: "checkbox_on") : UIImage(named: "checkbox_off")
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
}
