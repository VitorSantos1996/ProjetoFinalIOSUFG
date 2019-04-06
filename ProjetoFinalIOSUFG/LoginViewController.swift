//
//  LoginViewController.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 06/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var vrLogin: UITextField!
    @IBOutlet weak var vrPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        vrLogin.resignFirstResponder()
        vrPassword.resignFirstResponder()
    }
    
    @IBAction func proximaTela(_ sender: UIButton) {
        if (vrPassword.text == "1234") {
            let login = storyboard!.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
            
            self.present(login, animated: true, completion: nil)
        }else{
            let alert = UIAlertController(title: "Atenção", message: "Usuário ou Senha Inválidos", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alert, animated: true, completion: nil)
            
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        vrLogin.text = ""
        vrPassword.text = ""
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
