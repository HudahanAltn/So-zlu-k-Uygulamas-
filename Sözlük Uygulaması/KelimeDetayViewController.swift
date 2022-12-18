//
//  KelimeDetayViewController.swift
//  Sözlük Uygulaması
//
//  Created by Hüdahan Altun on 8.07.2022.
//

import UIKit

class KelimeDetayViewController: UIViewController {

    @IBOutlet weak var ingilizceLabel: UILabel!
    @IBOutlet weak var türkceLabel: UILabel!
    
    var kelime:Kelimeler?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let k = kelime{
            
            ingilizceLabel.text = k.getİngilizce()
            türkceLabel.text = k.getTürkce()
        }
    }


}
