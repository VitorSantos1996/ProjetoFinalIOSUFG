//
//  NovaReceitaViewController.swift
//  ProjetoFinalIOSUFG
//
//  Created by Vitor Pereira on 06/04/19.
//  Copyright © 2019 Vitor Pereira. All rights reserved.
//

import UIKit
import Firebase

class NovaReceitaViewController: UIViewController {

    
    let imagePicker = UIImagePickerController()
    var ref = DatabaseReference.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(NovaReceitaViewController.openGalley(tapGesture:)))
        vrImageReceita.isUserInteractionEnabled = true
        vrImageReceita.addGestureRecognizer(tapGesture)
        
    }
    
    @IBOutlet weak var vrImageReceita: UIImageView!
    @IBOutlet weak var vrNomeReceita: UITextField!
    @IBOutlet weak var vrTempo: UITextField!
    @IBOutlet weak var vrPorcao: UITextField!
    @IBOutlet weak var vrIngredientes: UITextView!
    
    @objc func openGalley(tapGesture: UITapGestureRecognizer){
        self.setypImagePicker()
    }
    
    
    @IBAction func novaReceita(_ sender: UIButton) {
        let nomeReceita: String! = vrNomeReceita.text
        let tempoPreparo: String! = vrTempo.text
        let porcaoReceita: String! = vrPorcao.text
        let ingredientesReceita: String! = vrIngredientes.text

        ref = Database.database().reference().child("Receitas").child(vrNomeReceita.text!)

        
        self.uploadImage(self.vrImageReceita.image!){ url in
            self.saveImage(nomeReceita: nomeReceita, tempoPreparo: tempoPreparo, porcaoReceita: porcaoReceita, ingredientesReceita: ingredientesReceita, imageURL: url!){ sucess in
                if sucess != nil{
                    print("Yeah yes")
                }
            }
        }
        

        
        vrNomeReceita.text = ""
        vrTempo.text = ""
        vrPorcao.text = ""
        vrIngredientes.text = ""
        vrImageReceita.image = UIImage()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        vrTempo.resignFirstResponder()
        vrPorcao.resignFirstResponder()
        vrIngredientes.resignFirstResponder()
    }

}

extension NovaReceitaViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func setypImagePicker() {
        if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
        imagePicker.sourceType = .savedPhotosAlbum
        imagePicker.delegate = self
        imagePicker.isEditing = true
            
        self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        vrImageReceita.image = image
        self.dismiss(animated: true, completion: nil)
    }
}


extension NovaReceitaViewController{
    
    func uploadImage(_ image:UIImage, completion: @escaping ((_ url: URL?) -> ())) {
        let storageRef = Storage.storage().reference().child(vrNomeReceita.text!)
        let imageData = vrImageReceita.image?.pngData()
        let metaData = StorageMetadata()
        metaData.contentType = "image/png"
        storageRef.putData(imageData!, metadata: metaData) { (metadata, error) in
            if error == nil{
                print("sucess")
                storageRef.downloadURL(completion: { (url, error) in
                    completion(url!)
                })
            }else{
                print("error in save image")
                completion(nil)
            }
        }
    }
    
    func saveImage(nomeReceita: String, tempoPreparo: String, porcaoReceita: String, ingredientesReceita: String, imageURL: URL, completion: @escaping ((_ url: URL?) -> ())) {

        let saveObject = [
            "nomeReceita" : nomeReceita,
            "tempoPreparo": tempoPreparo,
            "porcaoReceita": porcaoReceita,
            "ingredientesReceita": ingredientesReceita,
            "imageURL": imageURL.absoluteString
        ]

        self.ref.setValue(saveObject, withCompletionBlock: { error, ref in
            if error == nil {
                self.dismiss(animated: true, completion: nil)
            }else{

            }
        })
        
    }
}
