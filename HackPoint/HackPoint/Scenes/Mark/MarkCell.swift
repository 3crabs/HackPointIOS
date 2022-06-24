//
//  MarkCell.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

class MarkCell: UICollectionViewCell, Reusable {
    
    var cretiration: DTONoteCriterion?
    var note: DTONote?
    var currentNote: DTOPointWithNotes?
    var id: Int?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var chevronLeft: UIButton!
    @IBOutlet weak var chevronRight: UIButton!
    
    @IBOutlet weak var oneMark: ButtonCustomizable!
    @IBOutlet weak var twoMark: ButtonCustomizable!
    @IBOutlet weak var threeMark: ButtonCustomizable!
    @IBOutlet weak var fourMark: ButtonCustomizable!
    @IBOutlet weak var fiveMark: ButtonCustomizable!
    
    
    var tapOneHandler: ((Int, Int) -> Void)?
    var tapTwoHandler: ((Int, Int) -> Void)?
    var tapThreeHandler: ((Int, Int) -> Void)?
    var tapFourHandler: ((Int, Int) -> Void)?
    var tapFiveHandler: ((Int, Int) -> Void)?
    
    @IBAction func tapOneMark(_ sender: ButtonCustomizable) {
        tapOneHandler!(1, id!)
        sender.borderColor = .red
        sender.setTitleColor(.red, for: .normal)
        
        twoMark.borderColor = .white
        twoMark.setTitleColor(.white, for: .normal)
        
        threeMark.borderColor = .white
        threeMark.setTitleColor(.white, for: .normal)
        
        fourMark.borderColor = .white
        fourMark.setTitleColor(.white, for: .normal)
        
        fiveMark.borderColor = .white
        fiveMark.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func tapTwoMark(_ sender: ButtonCustomizable) {
        tapTwoHandler!(2, id!)
        sender.borderColor = .red
        sender.setTitleColor(.red, for: .normal)
        
        oneMark.borderColor = .white
        oneMark.setTitleColor(.white, for: .normal)
        
        threeMark.borderColor = .white
        threeMark.setTitleColor(.white, for: .normal)
        
        fourMark.borderColor = .white
        fourMark.setTitleColor(.white, for: .normal)
        
        fiveMark.borderColor = .white
        fiveMark.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func tapThreeMark(_ sender: ButtonCustomizable) {
        tapThreeHandler!(3, id!)
        sender.borderColor = .red
        sender.setTitleColor(.red, for: .normal)
        
        oneMark.borderColor = .white
        oneMark.setTitleColor(.white, for: .normal)
        
        twoMark.borderColor = .white
        twoMark.setTitleColor(.white, for: .normal)
        
        fourMark.borderColor = .white
        fourMark.setTitleColor(.white, for: .normal)
        
        fiveMark.borderColor = .white
        fiveMark.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func tapFourMark(_ sender: ButtonCustomizable) {
        tapFourHandler!(4, id!)
        sender.borderColor = .red
        sender.setTitleColor(.red, for: .normal)
        
        oneMark.borderColor = .white
        oneMark.setTitleColor(.white, for: .normal)
        
        twoMark.borderColor = .white
        twoMark.setTitleColor(.white, for: .normal)
        
        threeMark.borderColor = .white
        threeMark.setTitleColor(.white, for: .normal)
        
        fiveMark.borderColor = .white
        fiveMark.setTitleColor(.white, for: .normal)
    }
    
    @IBAction func tapFiveMark(_ sender: ButtonCustomizable) {
        tapFiveHandler!(5, id!)
        sender.borderColor = .red
        sender.setTitleColor(.red, for: .normal)
        
        oneMark.borderColor = .white
        oneMark.setTitleColor(.white, for: .normal)
        
        twoMark.borderColor = .white
        twoMark.setTitleColor(.white, for: .normal)
        
        threeMark.borderColor = .white
        fourMark.setTitleColor(.white, for: .normal)
        
        fourMark.borderColor = .white
        fourMark.setTitleColor(.white, for: .normal)
    }
    
    func update(indexPath: IndexPath, name: String, cretiration: DTONoteCriterion?, id: Int?, currentNotes: DTOPointWithNotes) {
        nameLabel.text = name
        if indexPath.row == 1 {
            chevronLeft.isHidden = true
        } else {
            chevronLeft.isHidden = false
        }
        self.cretiration = cretiration
        self.id = id
        
        let notes = currentNotes.points
        
        for currentNote in notes {
            if currentNote.id == id {
                if currentNote.point! == 1 {
                    oneMark.borderColor = .red
                    oneMark.setTitleColor(.red, for: .normal)
                    
                    twoMark.borderColor = .white
                    twoMark.setTitleColor(.white, for: .normal)
                    
                    threeMark.borderColor = .white
                    threeMark.setTitleColor(.white, for: .normal)
                    
                    fourMark.borderColor = .white
                    fourMark.setTitleColor(.white, for: .normal)
                    
                    fiveMark.borderColor = .white
                    fiveMark.setTitleColor(.white, for: .normal)
                } else if currentNote.point! == 2 {
                    twoMark.borderColor = .red
                    twoMark.setTitleColor(.red, for: .normal)
                    
                    oneMark.borderColor = .white
                    oneMark.setTitleColor(.white, for: .normal)
                    
                    threeMark.borderColor = .white
                    threeMark.setTitleColor(.white, for: .normal)
                    
                    fourMark.borderColor = .white
                    fourMark.setTitleColor(.white, for: .normal)
                    
                    fiveMark.borderColor = .white
                    fiveMark.setTitleColor(.white, for: .normal)
                } else if currentNote.point! == 3 {
                    threeMark.borderColor = .red
                    threeMark.setTitleColor(.red, for: .normal)
                    
                    oneMark.borderColor = .white
                    oneMark.setTitleColor(.white, for: .normal)
                    
                    twoMark.borderColor = .white
                    twoMark.setTitleColor(.white, for: .normal)
                    
                    fourMark.borderColor = .white
                    fourMark.setTitleColor(.white, for: .normal)
                    
                    fiveMark.borderColor = .white
                    fiveMark.setTitleColor(.white, for: .normal)
                } else if currentNote.point! == 4 {
                    fourMark.borderColor = .red
                    fourMark.setTitleColor(.red, for: .normal)
                    
                    oneMark.borderColor = .white
                    oneMark.setTitleColor(.white, for: .normal)
                    
                    twoMark.borderColor = .white
                    twoMark.setTitleColor(.white, for: .normal)
                    
                    threeMark.borderColor = .white
                    threeMark.setTitleColor(.white, for: .normal)
                    
                    fiveMark.borderColor = .white
                    fiveMark.setTitleColor(.white, for: .normal)
                } else if currentNote.point! == 5 {
                    fiveMark.borderColor = .red
                    fiveMark.setTitleColor(.red, for: .normal)
                    
                    oneMark.borderColor = .white
                    oneMark.setTitleColor(.white, for: .normal)
                    
                    twoMark.borderColor = .white
                    twoMark.setTitleColor(.white, for: .normal)
                    
                    threeMark.borderColor = .white
                    threeMark.setTitleColor(.white, for: .normal)
                    
                    fourMark.borderColor = .white
                    fourMark.setTitleColor(.white, for: .normal)
                } else {
                    twoMark.borderColor = .white
                    twoMark.setTitleColor(.white, for: .normal)
                    
                    oneMark.borderColor = .white
                    oneMark.setTitleColor(.white, for: .normal)
                    
                    twoMark.borderColor = .white
                    twoMark.setTitleColor(.white, for: .normal)
                    
                    threeMark.borderColor = .white
                    threeMark.setTitleColor(.white, for: .normal)
                    
                    fourMark.borderColor = .white
                    fourMark.setTitleColor(.white, for: .normal)
                }
            }
            
            
        }
    }
}
