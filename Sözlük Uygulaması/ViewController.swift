//
//  ViewController.swift
//  Sözlük Uygulaması
//
//  Created by Hüdahan Altun on 8.07.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var kelimeTableView: UITableView!
    
    var kelimelerListesi:[Kelimeler] = [Kelimeler]() // bu tableview'da gösterilecek veri kümesidir.test amaçlıdır
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        veritabanıKopyala()
 
        kelimelerListesi = KelimelerDAO().tümVerileriAL()
        
        
        kelimeTableView.delegate = self
        kelimeTableView.dataSource = self
        searchBar.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let index  = sender as! Int
        
        let gidilecekVC = segue.destination as! KelimeDetayViewController
        
        gidilecekVC.kelime = kelimelerListesi[index]
        
        
        
        
    }
    
    
    func veritabanıKopyala(){
        
        let bundleYolu = Bundle.main.path(forResource: "sozluk", ofType: "sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyala = URL(fileURLWithPath: hedefYol).appendingPathComponent("sozluk.sqlite")
        
        if fileManager.fileExists(atPath: kopyala.path){
            
            print("veritabanı zaten kopyalandı!")
        }else{
            
            do{
                try fileManager.copyItem(atPath: bundleYolu! , toPath: kopyala.path)
                print("veritabanı kopyalama başarılı!")
                
            }catch{
                
                print("veritabanı kopyalamada hata!")
            }
        }
    }
    

}

extension ViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return kelimelerListesi.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let kelimeTestForCell = kelimelerListesi[indexPath.row]
        
        let cell = kelimeTableView.dequeueReusableCell(withIdentifier: "kelimehücre",for:indexPath) as! KelimeHu_creTableViewCell
        
        cell.ingilizceLabel.text = kelimeTestForCell.getİngilizce()!
        cell.türkceLabel.text = kelimeTestForCell.getTürkce()!
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.performSegue(withIdentifier: "toDetay", sender: indexPath.row)
    }
    
}

extension ViewController:UISearchBarDelegate{
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        print("aramana sonucu :\(searchText)")
        
        kelimelerListesi = KelimelerDAO().aramaYap(inglizce: searchText)//arama yaptığımızda bu metod sürekli çalışır ve arama kelimesine göre veritabanından çekilen veriler bu listeye tekrar atanır
        
        kelimeTableView.reloadData()//her aramada sonrası tableview güncelleniyor.
    }
}
