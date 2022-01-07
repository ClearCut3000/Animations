//
//  ViewController.swift
//  Animations
//
//  Created by Николай Никитин on 07.01.2022.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  var touchCounter = 0
  var subview: UIView!
  let firstFrame = CGRect(x: 100, y: 100, width: 100, height: 100)
  let secondFrame = CGRect(x: 150, y: 150, width: 200, height: 200)

  //MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    subview = UIView(frame: firstFrame)
    subview.backgroundColor = UIColor.systemGreen
    view.addSubview(subview)
  }


  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    touchCounter += 1
    switch touchCounter {
    case 1:
      UIView.animate(withDuration: 3) {
        self.subview.backgroundColor = .orange
      }
    case 2:
      UIView.animate(withDuration: 3) {
        self.subview.backgroundColor = .purple
        self.subview.frame = self.secondFrame
      }
    case 3:
      UIView.animate(withDuration: 3) {
        self.subview.backgroundColor = .orange
        self.subview.frame = self.firstFrame
      }
    case 4:
      UIView.animate(withDuration: 3, animations: {
        self.subview.backgroundColor = .purple
        self.subview.frame = self.secondFrame
      }) { _ in
        UIView.animate(withDuration: 3) {
          self.subview.backgroundColor = .purple
          self.subview.frame = self.firstFrame
        }
      }
    case 5:
      UIView.animateKeyframes(withDuration: 3, delay: 0, options: [.autoreverse, .repeat]) {
        self.subview.backgroundColor = .orange
        self.subview.frame = self.secondFrame
      }

    default:
      touchCounter = 0
    }
  }


}

