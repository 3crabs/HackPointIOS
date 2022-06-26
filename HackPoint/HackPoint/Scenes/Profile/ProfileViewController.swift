//
//  ProfileViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 25.06.2022.
//

import UIKit

class ProfileViewController: UIViewController, Storyboarded {
    
    @IBOutlet var avatarImageView: UIImageView!
    
    var coordinator: ProfileCoordinator?
    var didSendEventClosure: ((ProfileViewController.Event) -> Void)?
    var edit = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
    }
    
    func setup() {
        title = "Профиль"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .edit,
            target: self,
            action: #selector(editProfile)
        )
    }
    
    @objc
    func editProfile() {
        let editProfileBarItem = UIBarButtonItem(
            barButtonSystemItem: .edit,
            target: self,
            action: #selector(editProfile)
        )
        let doneProfileBarItem = UIBarButtonItem(
            barButtonSystemItem: .done,
            target: self,
            action: #selector(editProfile)
        )
        edit.toggle()
        navigationItem.rightBarButtonItem = edit ? doneProfileBarItem : editProfileBarItem
    }
}

extension ProfileViewController {
    enum Event {
        case profile
    }
}

