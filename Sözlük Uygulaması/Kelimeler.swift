//
//  Kelimeler.swift
//  Sözlük Uygulaması
//
//  Created by Hüdahan Altun on 8.07.2022.
//

import Foundation

class Kelimeler{
    
    private var kelime_id:Int?
    private var ingilizce:String?
    private var turkce:String?
    
    init(){
        
    }
    
    init(kelime_id:Int,ingilizce:String,turkce:String){
        
        self.kelime_id = kelime_id
        self.ingilizce = ingilizce
        self.turkce = turkce
    }
    
    func getKelime_id()->Int?{
        
        return kelime_id!
    }
    
    func getİngilizce()->String?{
        
        return ingilizce!
    }
    
    func getTürkce()->String?{
        
        return turkce!
    }
    
}
