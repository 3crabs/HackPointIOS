//
//  RegistrationViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

class RegistrationViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBOutlet private var nameTextField: TextField!
    @IBOutlet private var sirnameTextField: TextField!
    
    @IBOutlet private var loginTextField: TextField!
    @IBOutlet private var passwordTextField: TextField!
    @IBOutlet private var roleTextField: TextField!
    
    @IBOutlet private var githubTextField: TextField!
    
    @IBOutlet private weak var scrollView: UIScrollView!
    private var rolePickerView = UIPickerView()
    
    var progressHUD: ProgressHUD!
    var subView: UIView!
    
    var roles = [DTORole]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getRoles()
        
        let tap = UITapGestureRecognizer(target: self, action:#selector(RegistrationViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name:UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name:UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        
        
        nameTextField.delegate = self
        sirnameTextField.delegate = self
        loginTextField.delegate = self
        passwordTextField.delegate = self
        githubTextField.delegate = self
        
        nameTextField.tag = 0
        sirnameTextField.tag = 1
        loginTextField.tag = 2
        passwordTextField.tag = 3
        roleTextField.tag = 4
        githubTextField.tag = 5
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.sizeToFit()

        let doneButton = UIBarButtonItem(title: "Выбрать", style: UIBarButtonItem.Style.done, target: self, action: #selector(selectRole))
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        roleTextField.inputView = rolePickerView
        roleTextField.inputAccessoryView = toolBar
        rolePickerView.delegate = self
        rolePickerView.dataSource = self
    }
    
    private func getRoles() {
        showProgressHUD()
        APIClient.shared.getRoles {
            [weak self] result in
            
            switch result {
            case .success(let roles):
                self?.roles = roles
                self?.hideProgressHUD()
            case .failure(let error):
                print(error)
                self?.hideProgressHUD()
            }
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
            roleTextField.becomeFirstResponder()
        case roleTextField:
            githubTextField.becomeFirstResponder()
        default:
            githubTextField.resignFirstResponder()
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
    
    @objc
    private func selectRole() {
        let row = rolePickerView.selectedRow(inComponent: 0)
        rolePickerView.selectRow(row, inComponent: 0, animated: false)
        roleTextField.text = roles[row].description
        rolePickerView.resignFirstResponder()
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switchBasedNextTextField(textField)
        return true
    }
}

extension RegistrationViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        roles.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        roles[row].description
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        roleTextField.text = roles[row].description
    }
}
