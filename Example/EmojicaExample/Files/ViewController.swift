//
//  ------------------------------------------------------------------------
//
//  Copyright 2017 Dan Lindholm
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//
//  ------------------------------------------------------------------------
//
//  ViewController.swift
//

import UIKit
import Emojica

class ViewController: UIViewController, UITextViewDelegate {
    
    // MARK: - Initialization
    let emojica = Emojica()
    
    // MARK: - Modifiable values
    lazy var font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.thin)
    lazy var images: Emojica.ImageSet = .default
    
    // MARK: - Usage of convert
    func convert() {
        textView.attributedText = emojica.convert(string: textView.emojicaText)
    }
    
    // MARK: - Usage of revert
    func revert() {
        textView.text = emojica.revert(attributedString: textView.emojicaText)
    }
    
    // MARK: - Usage of textViewDidChange(_:)
    func textViewDidChange(_ textView: UITextView) {
        guard state.isOn else { return }
        emojica.textViewDidChange(textView)
    }
    
    // MARK: - Ignore
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var bottom: NSLayoutConstraint!
    
    @IBOutlet weak var imageSet: UIBarButtonItem!
    @IBAction func imageSetPressed(_ sender: UIBarButtonItem) { sheet() }
    
    @IBOutlet weak var state: UISwitch!
    @IBAction func stateChanged(_ sender: UISwitch) {
        if state.isOn {
            if AppDelegate.noImages {
                alert()
                state.setOn(false, animated: true)
                return
            }
        }
        state.isOn ? convert() : revert()
    }
    
    
}

// MARK: - Ignore
extension ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    func setup() {
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillChangeFrame(_:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        self.set(imageSet: images)
        textView.delegate = self
        textView.text = "V14 emoji 🫠🫢🫣🫡🫥🫤🥹🫱🏿🫱🫲🫲🏽🫳🫴🫰🫰🏽🫵🏾🫵🏾🫶🫦🫅🫄🫃🧌🪸🪷🪹🪺🫘🫙🫗🛝🛞🛟🪬🪩🪫🩼🩻🫧🪪🟰"
        textView.font = font
        emojica.font = font
        emojica.revertible = true
    }
    
    func set(imageSet: Emojica.ImageSet) {
        emojica.imageSet = imageSet
        self.imageSet.title = emojica.imageSet.rawValue
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        if let info = notification.userInfo {
            let animationTime = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            bottom.constant = 0
            UIView.animate(withDuration: animationTime, animations: { self.view.layoutIfNeeded() })
        }
    }
    
    @objc func keyboardWillChangeFrame(_ notification: NSNotification) {
        if let info = notification.userInfo {
            let animationTime = info[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
            let endFrame = (info[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            bottom.constant = endFrame.height
            UIView.animate(withDuration: animationTime, animations: { self.view.layoutIfNeeded() })
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
    }
}

extension ViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if AppDelegate.noImages {
            alert()
        }
    }
    
    func alert() {
        let alert = UIAlertController(title: "No Images", message: "You need to import an image set for this to work.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func sheet() {
        let sheet = UIAlertController.init(title: nil, message: "Select Image Set", preferredStyle: .actionSheet)
        let imageSets = [Emojica.ImageSet.default, Emojica.ImageSet.twemoji, Emojica.ImageSet.emojione, Emojica.ImageSet.noto]
        for imageSet in imageSets {
            let action = UIAlertAction(title: imageSet.rawValue, style: .default) { _ in
                self.set(imageSet: imageSet)
                if self.state.isOn {
                    let reverted = self.emojica.revert(attributedString: self.textView.emojicaText)
                    self.textView.emojicaText = self.emojica.convert(string: reverted)
                }
            }
            sheet.addAction(action)
        }
        sheet.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.cancel, handler: nil))
        present(sheet, animated: true, completion: nil)
    }
}
