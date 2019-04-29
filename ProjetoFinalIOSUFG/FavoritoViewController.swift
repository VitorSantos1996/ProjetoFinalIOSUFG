//
//  FavoritoViewController.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 18/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import UIKit

class FavoritoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var vrTableViewFavorito: UITableView!
    @IBOutlet weak var btnProfile: UIBarButtonItem!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let novaCelula = tableView.dequeueReusableCell(withIdentifier: "celulaFavorito") as! FavoritoControllerTableViewCell
        
        novaCelula.vrImagemFavorito.image = UIImage()
        novaCelula.vrNomeFavorito.text = "Nome Favorito"
        novaCelula.vrCategoriaFavorito.text = "Categoria Favorito"
        novaCelula.vrImagemFavorito.image = UIImage()
        
        return novaCelula
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
