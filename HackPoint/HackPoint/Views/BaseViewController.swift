//
//  BaseViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit
import Alamofire

class BaseViewController: UIViewController {
    
    var progressHUD: ProgressHUD!
    var subView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.backgroundColor = .systemGray6
        
        guard let navigationController = navigationController else { fatalError("Not found NavigationController") }
        
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "logout"), for: .normal)
        button.addTarget(self, action: #selector(clickProfile(_ :)), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        let barButton = UIBarButtonItem(customView: button)
        navigationItem.rightBarButtonItem = barButton
        
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(goBack(_ :)), for: .touchUpInside)
        backButton.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        let backBarButton = UIBarButtonItem(customView: backButton)
        
        navigationItem.leftBarButtonItems = [backBarButton]
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
    
    @objc func clickProfile(_ sender: UIButton) {
        
    }
    
    @objc func goBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
}
