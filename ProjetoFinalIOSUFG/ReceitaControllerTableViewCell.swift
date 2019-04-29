//
//  ReceitaControllerTableViewCell.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 18/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import UIKit
import Kingfisher

class ReceitaControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var vrImageReceita: UIImageView!
    @IBOutlet weak var vrNomeReceita: UILabel!
    @IBOutlet weak var vrCategoriaReceita: UILabel!
    @IBOutlet weak var vrFavoritoReceita: UIImageView!    
    
    func tapGesture() {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(ReceitaControllerTableViewCell.openGalley(tapGesture:)))
        vrFavoritoReceita.isUserInteractionEnabled = true
        vrFavoritoReceita.addGestureRecognizer(tapGesture)

    }

    @objc func openGalley(tapGesture: UITapGestureRecognizer) {
        vrFavoritoReceita.image = UIImage(named: "coracao-aceso-83.5")
    }
    
    var receitaModel: ReceitaModel?{
        didSet{
            vrNomeReceita.text = receitaModel?.nome
            vrCategoriaReceita.text = receitaModel?.porcao
            
            let url = URL(string: (receitaModel?.imageURL)!)
            if let url = url{
                KingfisherManager.shared.retrieveImage(with: url as Resource, options: nil, progressBlock: nil){(image, error, cache, imageURL) in
                    self.vrImageReceita.image = image
                    self.vrImageReceita.kf.indicatorType = .activity
                }
            }

            tapGesture()
            
        }
    }

}
