//
//  KelimelerDAO.swift
//  Sözlük Uygulaması
//
//  Created by Hüdahan Altun on 8.07.2022.
//

import Foundation


class KelimelerDAO{
    
    var db:FMDatabase?
    
    init(){
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let veritabanıURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        
        db = FMDatabase(path: veritabanıURL.path)
        
    }
    
    
    func tümVerileriAL()->[Kelimeler]{
        
        var kelimeListesi:[Kelimeler] = [Kelimeler]()
        
        
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kelimeler", values: nil)
            
            while rs.next(){
                
                let kelime = Kelimeler(kelime_id: Int(rs.string(forColumn: "kelime_id"))!, ingilizce: rs.string(forColumn: "ingilizce")!, turkce: rs.string(forColumn: "turkce")!)
                
                kelimeListesi.append(kelime)
            }
            
            
            print("tüm verileri alma başarılı!")
            
        }catch{
            
            print("tüm verileri alırken hata oluştu")
        }
        
        return kelimeListesi
    }
    
    
    func aramaYap(inglizce:String)->[Kelimeler]{
        
        var kelimeListesi:[Kelimeler] = [Kelimeler]()
        
        
        db?.open()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM kelimeler WHERE ingilizce like '%\(inglizce)%' ", values:nil )
            
            while rs.next(){
                
                let kelime = Kelimeler(kelime_id: Int(rs.string(forColumn: "kelime_id"))!, ingilizce: rs.string(forColumn: "ingilizce")!, turkce: rs.string(forColumn: "turkce")!)
                
                kelimeListesi.append(kelime)
            }
            
            
            print("aramayapma başarılı!")
            
        }catch{
            
            print("arama yaparken hata oluştu")
        }
        
        return kelimeListesi
    }
    
}
