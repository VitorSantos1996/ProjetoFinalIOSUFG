//
//  ProfileViewController.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 18/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var vrImageProfile: UIImageView!
    
    @IBOutlet weak var vrNameProfile: UILabel!
    
    @IBOutlet weak var vrSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func Notificacoes(_ sender: UISwitch) {
        PersistenceManager.save(value: vrSwitch.isOn)
    }
    @IBAction func Logout(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Atenção", message: "Deseja mesmo sair:", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Sim", style: .default, handler: {
            (UIAlertAction) in self.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Não", style: .cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        vrSwitch.isOn = PersistenceManager.getValue()
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
