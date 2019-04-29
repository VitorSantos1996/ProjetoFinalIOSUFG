//
//  ReceitaViewController.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 18/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import UIKit
import Firebase
import Kingfisher

class ReceitaViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var ref = DatabaseReference.init()
    
    @IBOutlet weak var vrTableViewReceita: UITableView!
    
    var receitaList = [ReceitaModel]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return receitaList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let novaCelula = tableView.dequeueReusableCell(withIdentifier: "celulaReceita", for: indexPath) as! ReceitaControllerTableViewCell
        
        novaCelula.receitaModel = receitaList[indexPath.row]
        
        return novaCelula
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "proxTela" {
            let svc = segue.destination as! DetailViewController
            
            if let indexPath = self.vrTableViewReceita.indexPathForSelectedRow{
                let segueData : ReceitaModel
                segueData = receitaList[indexPath.row]
                
                svc.nome = segueData.nome!
                svc.tempo = segueData.tempo!
                svc.porcao = segueData.porcao!
                svc.ingredientes = segueData.ingredientes!
                svc.imagem = segueData.imageURL
                
            }
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ref: DatabaseReference
        ref = Database.database().reference().child("Receitas")
        
        ref.observe(.value) { (snapshot) in
            self.receitaList.removeAll()
            if let snapShot = snapshot.children.allObjects as? [DataSnapshot]{
                for snap in snapShot{
                    if let mainDict = snap.value as? [String: AnyObject]{
                        let nomeReceita = mainDict["nomeReceita"] as? String
                        let tempoReceita = mainDict["tempoPreparo"] as? String
                        let porcaoReceita = mainDict["porcaoReceita"] as? String
                        let ingredientesReceita = mainDict["ingredientesReceita"] as? String
                        let imageURL = mainDict["imageURL"] as? String
                        
                        self.receitaList.append(ReceitaModel(nome: nomeReceita, tempo: tempoReceita, porcao: porcaoReceita, ingredientes: ingredientesReceita, imageURL: imageURL))
                        self.vrTableViewReceita.reloadData()
                    }
                }
            }
        }
        
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
