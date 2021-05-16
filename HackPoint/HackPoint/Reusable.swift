//
//  Reusables.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

protocol Reusable {
  static var reuseId: String { get }
}

extension Reusable where Self: UITableViewCell {
  static var reuseId: String {
    return String(describing: Self.self)
  }
}

extension Reusable where Self: UICollectionViewCell {
  static var reuseId: String {
    return String(describing: Self.self)
  }
}

extension Reusable where Self: UITableViewHeaderFooterView {
  static var reuseId: String {
    return String(describing: Self.self)
  }
}

protocol Nibable {
  static var nib: UINib { get }
}

extension Nibable where Self: UITableViewHeaderFooterView {
  static var nib: UINib {
    return UINib(nibName: String(describing: Self.self), bundle: nil)
  }
}

