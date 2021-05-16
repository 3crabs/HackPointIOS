//
//  MarkViewController.swift
//  HackPoint
//
//  Created by Maxim Butin on 15.05.2021.
//

import UIKit

class MarkViewController: BaseViewController, Storyboarded {
  
  weak var coordintar: MainCoordinator?
  
  @IBOutlet weak var markCollectionView: UICollectionView!
  @IBOutlet weak var noteTextView: UITextView!
  @IBOutlet weak var scrollView: UIScrollView!
  
  @IBOutlet weak var teamName: UILabel!
  
  var team: DTOTeam?
  
  var notes: [DTONote] = []
  var currentNotes: DTOPointWithNotes?
  

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    markCollectionView.delegate = self
    markCollectionView.dataSource = self
    
    noteTextView.layer.borderWidth = 1
    noteTextView.layer.borderColor = UIColor.systemGray6.cgColor
    noteTextView.delegate = self
    noteTextView.text = ""
    
    let tap = UITapGestureRecognizer(target: self, action:#selector(MarkViewController.dismissKeyboard))
    view.addGestureRecognizer(tap)
    
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name:UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name:UIResponder.keyboardWillHideNotification, object: nil)
    
    guard let team = team else { return }
    
    teamName.text = team.name
    
    
  }
  
  func getNote() {
    
    guard let team = team else { return }
    APIClient.shared.getNote(teamId: team.id!) { [weak self] result in
      switch result {
      case .success(let notes):
        self?.notes = notes.points
        self?.markCollectionView.reloadData()
    
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
  
  func getPoints() {
    APIClient.shared.getPointWithNote(teamId: team!.id!, completion: { [weak self] result in
      switch result {
      case .success(let notes):
        self?.currentNotes = notes
        self?.markCollectionView.reloadData()
      case .failure(let error):
        print(error.localizedDescription)
      }
    })
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    getNote()
    getPoints()
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
}

extension MarkViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if notes.isEmpty {
      return 0
    } else {
      return notes.count + 1
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    if indexPath.row != 4 {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarkCell.reuseId, for: indexPath) as? MarkCell else { fatalError("Not found \(MarkCell.reuseId)")}
      let note = notes[indexPath.row]
      if let currentNode = currentNotes {
        cell.update(indexPath: indexPath, name: note.criterion!.name!, cretiration: note.criterion!, id: note.id!, currentNotes: currentNode)
        
      }
      
      
      cell.tapOneHandler = { [weak self] point, id in
        self?.showProgressHUD()
        APIClient.shared.putPoint(id: id, point: point) { result in
          switch result {
          case .success(_):
            if indexPath.row + 1 <= 5 {
              collectionView.isPagingEnabled = false
              collectionView.scrollToItem(
                  at: IndexPath(item: indexPath.row + 1, section: 0),
                  at: .centeredHorizontally,
                  animated: true
              )
              collectionView.isPagingEnabled = true
            }
            self?.hideProgressHUD()
            break
          case .failure(let error):
            print(error.localizedDescription)
          }
        }
      }
      
      cell.tapTwoHandler = { [weak self] point, id in
        self?.showProgressHUD()
        APIClient.shared.putPoint(id: id, point: point) { result in
          switch result {
          case .success(_):
            if indexPath.row + 1 <= 5 {
              collectionView.isPagingEnabled = false
              collectionView.scrollToItem(
                  at: IndexPath(item: indexPath.row + 1, section: 0),
                  at: .centeredHorizontally,
                  animated: true
              )
              collectionView.isPagingEnabled = true
            }
            self?.hideProgressHUD()
          case .failure(let error):
            print(error.localizedDescription)
          }
        }
      }
      
      cell.tapThreeHandler = { [weak self] point, id in
        self?.showProgressHUD()
        APIClient.shared.putPoint(id: id, point: point) { result in
          switch result {
          case .success(_):
            if indexPath.row + 1 <= 5 {
              collectionView.isPagingEnabled = false
              collectionView.scrollToItem(
                  at: IndexPath(item: indexPath.row + 1, section: 0),
                  at: .centeredHorizontally,
                  animated: true
              )
              collectionView.isPagingEnabled = true
            }
            self?.hideProgressHUD()
          case .failure(let error):
            print(error.localizedDescription)
          }
        }
      }
      
      cell.tapFourHandler = { [weak self] point, id in
        self?.showProgressHUD()
        APIClient.shared.putPoint(id: id, point: point) { result in
          switch result {
          case .success(_):
            if indexPath.row + 1 <= 5 {
              collectionView.isPagingEnabled = false
              collectionView.scrollToItem(
                  at: IndexPath(item: indexPath.row + 1, section: 0),
                  at: .centeredHorizontally,
                  animated: true
              )
              collectionView.isPagingEnabled = true
            }
            self?.hideProgressHUD()
          case .failure(let error):
            print(error.localizedDescription)
          }
        }
      }
      
      cell.tapFiveHandler = { [weak self] point, id in
        self?.showProgressHUD()
        APIClient.shared.putPoint(id: id, point: point) { result in
          switch result {
          case .success(_):
            if indexPath.row + 1 <= 5 {
              collectionView.isPagingEnabled = false
              collectionView.scrollToItem(
                  at: IndexPath(item: indexPath.row + 1, section: 0),
                  at: .centeredHorizontally,
                  animated: true
              )
              collectionView.isPagingEnabled = true
            }
            
            self?.hideProgressHUD()
          case .failure(let error):
            print(error.localizedDescription)
          }
        }
      }
      
      return cell
    } else {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FinishCell.reuseId, for: indexPath) as? FinishCell else { fatalError("Not found \(FinishCell.reuseId)")}
      cell.teamId = team!.id
      
      cell.handlerAction = { id in
        APIClient.shared.putTeam(id: id) { result in
          switch result {
          case .success(_):
            
//            self.hideProgressHUD()
            self.navigationController?.popViewController(animated: true)
            
          case .failure(let error):
            print(error.localizedDescription)
          }
        }
      }
      
      return cell
    }
    
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width - 10, height: collectionView.frame.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
  }
  
}

extension MarkViewController: UITextViewDelegate {
  func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
    if(text == "\n") {
      textView.resignFirstResponder()
      return false
    }
    return true
  }
  
}
