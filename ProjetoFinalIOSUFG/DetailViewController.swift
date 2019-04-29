//
//  DetailViewController.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 18/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var vrImageView: UIImageView!
    @IBOutlet weak var vrNomeReceita: UILabel!
    @IBOutlet weak var vrTempoReceita: UILabel!
    @IBOutlet weak var vrPorcaoReceita: UILabel!
    @IBOutlet weak var vrIngredientesReceita: UITextView!
    
    public var nome: String!
    public var tempo: String!
    public var porcao: String!
    public var ingredientes: String!
    public var imagem: String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        vrImageView.image = UIImage(named: imagem)
        vrNomeReceita.text = nome
        vrTempoReceita.text = tempo
        vrPorcaoReceita.text = porcao
        vrIngredientesReceita.text = ingredientes
        
        let url = URL(string: (imagem)!)
        
        if let url = url{
            KingfisherManager.shared.retrieveImage(with: url as Resource, options: nil, progressBlock: nil){(image, error, cache, imageURL) in
                self.vrImageView.image = image
                self.vrImageView.kf.indicatorType = .activity
            }
        }
        
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
