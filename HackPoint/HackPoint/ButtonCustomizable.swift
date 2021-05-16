//
//  ButtonCustomizable.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

@IBDesignable
class ButtonCustomizable: UIButton {
  
  // MARK: - Initialization
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
  }
  
  // MARK: - UI Setup
  override func prepareForInterfaceBuilder() {
    setupView()
  }
  
  func setupView() {
    self.layer.cornerRadius = cornerRadius
  }
  
  // MARK: - Properties
  
  @IBInspectable
  var cornerRadius: CGFloat = 40 {
    didSet {
      self.layer.cornerRadius = cornerRadius
    }
  }
  
  @IBInspectable
  var borderWidth: CGFloat = 0 {
    didSet {
      self.layer.borderWidth = borderWidth
    }
  }
  
  @IBInspectable
  var borderColor: UIColor = .white {
    didSet {
      self.layer.borderColor = borderColor.cgColor
    }
  }
  
}
