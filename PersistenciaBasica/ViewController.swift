//
//  ViewController.swift
//  PersistenciaBasica
//
//  Created by David López on 4/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    var fechaEdicion: Date?
    let prefs = UserDefaults()
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var labelView: UILabel!
    @IBAction func buttonView(_ sender: UIButton) {
        self.fechaEdicion = Date()
        prefs.set(self.fechaEdicion, forKey:"fecha")
        prefs.set(self.textView.text, forKey:"texto")
        prefs.synchronize()
        self.labelView.text = DateFormatter.localizedString(
                     from:self.fechaEdicion!,
                     dateStyle: .short, timeStyle: .medium)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prefs.register(defaults:["fecha" : Date(), "texto" : "No hay texto guardado"])
        self.textView.text = prefs.string(forKey:"texto")
        let fechaGuardada = prefs.object(forKey:"fecha") as! Date
        self.labelView.text = DateFormatter.localizedString(
                     from:fechaGuardada,
                     dateStyle: .short, timeStyle: .medium)
    }


}

