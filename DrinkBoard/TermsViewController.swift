//
//  TermsViewController.swift
//  DrinkBoard
//
//  Created by Marko Splajt on 22/10/2018.
//  Copyright © 2018 MarkoSplajt. All rights reserved.
//

import UIKit
import SpriteKit

class TermsViewController: UIViewController, UITextFieldDelegate {

    //@IBOutlet var nameTextField: UITextField!
    @IBOutlet var continueOutlett: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        continueOutlett.isEnabled = true
        //nameTextField.delegate = self
    }
    
    @IBAction func termsButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://drinkboardapp.wixsite.com/privacy-policy/terms-and-conditions")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func privacyButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://drinkboardapp.wixsite.com/privacy-policy")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func continueClicked(_ sender: UIButton) {
        UserDefaults.standard.set("name", forKey: "name")
        self.dismiss(animated: true, completion: nil)
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 0.6,
                                options: .curveEaseOut, animations: {
                                    self.view.alpha = 0
        }) {(_) in
            self.view.removeFromSuperview()
            self.removeFromParent()
        }
    }
    
    /*func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        continueOutlett.isEnabled = true
        return true
    }
    
    @IBAction func nameChar(_ sender: UITextField)
    {
        maxLength(textFieldName: nameTextField, max: 15)
    }
    
    func maxLength(textFieldName: UITextField, max: Int)
    {
        let length = textFieldName.text?.count
        let char = textFieldName.text
        
        if (length! > max)
        {
            let index = char?.index((char?.startIndex)!, offsetBy: max)
            textFieldName.text = String((textFieldName.text?[..<index!])!)
        }
    }*/
}
