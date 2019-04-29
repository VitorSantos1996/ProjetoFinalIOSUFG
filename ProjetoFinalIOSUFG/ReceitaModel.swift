//
//  ReceitaModel.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 19/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//
import UIKit
import Foundation

class ReceitaModel {
    
    var nome: String?
    var tempo: String?
    var porcao: String?
    var ingredientes: String?
    var imageURL: String?
    
    init(nome:String?, tempo:String?, porcao:String?, ingredientes:String?, imageURL:String?) {
        self.nome = nome
        self.porcao = porcao
        self.tempo = tempo
        self.ingredientes = ingredientes
        self.imageURL = imageURL
    }
    
}
