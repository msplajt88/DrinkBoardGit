//
//  InfoViewController.swift
//  DrinkBoard
//
//  Created by Marko Splajt on 29/12/2017.
//  Copyright © 2017 MarkoSplajt. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func termsButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://drinkboardapp.wixsite.com/privacy-policy/terms-and-conditions")! as URL, options: [:], completionHandler: nil)
    }
    
    @IBAction func privacyButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://drinkboardapp.wixsite.com/privacy-policy")! as URL, options: [:], completionHandler: nil)
    }
    @IBAction func cookieButton(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://drinkboardapp.wixsite.com/privacy-policy/cookie-policy")! as URL, options: [:], completionHandler: nil)
    }
}
