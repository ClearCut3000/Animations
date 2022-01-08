//
//  ViewController.swift
//  Animations
//
//  Created by Николай Никитин on 07.01.2022.
//

import UIKit

class ViewController: UIViewController {

  //MARK: - Properties
  var touchCounter = 0 {
    didSet {
      label.text = "\(touchCounter)"
    }
  }
  var subview: UIView!
  var label = UILabel(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
  let firstFrame = CGRect(x: 100, y: 100, width: 100, height: 100)
  let secondFrame = CGRect(x: 150, y: 150, width: 200, height: 200)
  var imageView: UIImageView!
  var constraint: NSLayoutConstraint!

  //MARK: - View lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    subview = UIView(frame: firstFrame)
    subview.backgroundColor = UIColor.systemGreen
    view.addSubview(subview)
    label.text = "0"
    label.font = UIFont.systemFont(ofSize: 33)
    view.addSubview(label)

    imageView = UIImageView(image: UIImage(named: "someImage"))
    imageView.contentMode = .scaleAspectFill
    imageView.clipsToBounds = true
    imageView.frame = CGRect(x: 10, y: 300, width: 100, height: 100)
    view.addSubview(imageView)

    constraint = NSLayoutConstraint(
      item: view,
      attribute: .width,
      relatedBy: .equal,
      toItem: imageView!,
      attribute: .width,
      multiplier: 0.5,
      constant: 0
    )

    view.addConstraint(constraint)
  }


  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)

    touchCounter += 1

    switch touchCounter {
    case 1:
      UIView.animate(withDuration: 1) {
        self.subview.backgroundColor = .orange
      }
    case 2:
      UIView.animate(withDuration: 1) {
        self.subview.backgroundColor = .purple
        self.subview.frame = self.secondFrame
      }
    case 3:
      UIView.animate(withDuration: 1) {
        self.subview.backgroundColor = .orange
        self.subview.frame = self.firstFrame
      }
    case 4:
      UIView.animate(withDuration: 1, animations: {
        self.subview.backgroundColor = .purple
        self.subview.frame = self.secondFrame
      }) { _ in
        UIView.animate(withDuration: 1) {
          self.subview.backgroundColor = .purple
          self.subview.frame = self.firstFrame
        }
      }
    case 5:
      UIView.animateKeyframes(withDuration: 1, delay: 0, options: [.autoreverse]) {
        self.subview.backgroundColor = .red
        self.subview.frame = self.secondFrame
      }
    case 6:
      let scaleTramsform = CGAffineTransform(scaleX: 2, y: 2)
      let rotateTransform = CGAffineTransform(rotationAngle: .pi)
      let translateTransform = CGAffineTransform(translationX: 200, y: 200)
      let comboTransform = scaleTramsform.concatenating(rotateTransform).concatenating(translateTransform)
      UIView.animate(withDuration: 3) {
        self.subview.transform = comboTransform
      }
    default:
      touchCounter = 0
      self.subview.backgroundColor = .systemGreen
      self.subview.frame = firstFrame
    }
  }


}

