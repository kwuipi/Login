//
//  ViewController.swift
//  TestApp
//
//  Created by Евгений Таран on 12/9/17.
//  Copyright © 2017 Zhenya Taran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        guard let login = login.text, let password = password.text , login.count > 0 , password.count > 0 else {
            let alertField = UIAlertController(title: "Alert", message: "Login or password field is empty.", preferredStyle: .alert)
            alertField.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
            self.present(alertField, animated: true, completion: nil)
            return
        }
        
        var listOfUseres: [(String,String)] = []
        listOfUseres.append(("Borya","111"))
        listOfUseres.append(("Zhenya","222"))
        var checkUserPass = true
        for (loginList, passwordList) in listOfUseres {
            if login.lowercased() == loginList.lowercased() && password == passwordList {
                checkUserPass = true
                break
            }
            else {
                checkUserPass = false
            }
        }
        if checkUserPass {
            self.performSegue(withIdentifier: "showNextScreen", sender: sender)
        }
        else {
            let alertField = UIAlertController(title: "Alert", message: "Invalid login or password.", preferredStyle: .alert  )
            alertField.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: nil))
            self.present(alertField, animated: true, completion: nil)
        }
    }
}


