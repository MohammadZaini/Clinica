//
//  HomePage.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class HomePage: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrClinics.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ClinicsCollectionView.dequeueReusableCell(withReuseIdentifier: "ClinicCell", for: indexPath) as! ClinicsCollectionViewCell
        let data = arrClinics[indexPath.row]
        cell.setUpCell(photo: data.photo, name: data.name)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.3, height: self.view.frame.width * 0.3)
    }
     
    

    @IBOutlet weak var ClinicsCollectionView: UICollectionView!
    var arrClinics = [Clinic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ClinicsCollectionView.delegate = self
        ClinicsCollectionView.dataSource = self
        
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "tooth")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "kidney")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        
        
    }
    


}

struct Clinic {
    
    let photo : UIImage
    let name : String
    
}
