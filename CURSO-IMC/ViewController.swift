//
//  ViewController.swift
//  CURSO-IMC
//
//  Created by Ronaldo Jacinto on 31/01/22.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var ivResult: UIImageView!
    @IBOutlet weak var viResult: UIView!
    
    @IBOutlet weak var btCalculate: UIButton!
    
    var imc: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btCalculate.layer.cornerRadius = 6
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources tha can be recreated
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        
    }
    
    @IBAction func calculate(_ sender: Any) {
        let formatWeight=tfWeight.text!.replacingOccurrences(of: ",", with: ".")
        let formatHeight=tfHeight.text!.replacingOccurrences(of: ",", with: ".")
        
        if let weight = Double(formatWeight),
           let height = Double(formatHeight){
            imc = weight / (height*height)
            showResults()
        }
    }
    func showResults() {
        var result: String = ""
        var image: String = ""
        switch imc {
        case 0..<16:
            result = "Magreza"
            image = "abaixo"
        case 16..<18.5:
            result = "Abaixo do peso"
            image = "abaixo"
        case 18.5..<25:
            result = "peso ideal"
            image = "ideal"
        case 25..<30:
            result = "Sobrepeso"
            image = "sobre"
        default:
            result = "Obesidade"
            image = "obesidade"
            
        }
        lbResult.text = "\(Int(imc)): \(result)"
        ivResult.image = UIImage(named: image)
        viResult.isHidden = false
        view.endEditing(true)
    }
    
}
