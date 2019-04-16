//
//  LoginViewController.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 16/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import UIKit
import FirebaseUI

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func vrLogin(_ sender: Any) {
        
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            return
        }
        
        authUI?.delegate = self
        
        let phoneAuth = FUIPhoneAuth(authUI: authUI!)
        
        authUI?.providers = [FUIEmailAuth(), phoneAuth]
        
        let authViewController = authUI!.authViewController()
        
        present(authViewController, animated: true, completion: nil)
    }

}

extension LoginViewController:FUIAuthDelegate{
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            return
        }
        
        performSegue(withIdentifier: "goHome", sender: self)
    }
}
