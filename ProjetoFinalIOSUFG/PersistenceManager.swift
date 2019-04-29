//
//  PersistenceManager.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 29/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import Foundation

class PersistenceManager: NSObject {
    
    class func save(value:Bool){
        let defaults = UserDefaults.standard
        defaults.set(value, forKey: "notifications")
    }
    
    class func getValue()->Bool{
        let defaults = UserDefaults.standard
        let value = defaults.bool(forKey: "notifications")
        
        return value
    }
}
