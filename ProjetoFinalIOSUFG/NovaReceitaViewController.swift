//
//  NovaReceitaViewController.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 06/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import UIKit

class NovaReceitaViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var vrTempo: UITextField!
    @IBOutlet weak var vrPorcao: UITextField!
    @IBOutlet weak var vrIngredientes: UITextView!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        vrTempo.resignFirstResponder()
        vrPorcao.resignFirstResponder()
        vrIngredientes.resignFirstResponder()
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
