//
//  FinishCell.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

class FinishCell: UICollectionViewCell, Reusable {
  
  var teamId: Int?
  
  var handlerAction: ((Int) -> Void)?
  
  @IBAction func finish(_ sender: UIButton) {
    handlerAction?(teamId!)
  }
  
  
}
