//
//  HomePage.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class HomePage: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var TopCollectionView: UICollectionView!
    
    @IBOutlet weak var PageControl: UIPageControl!
    
    @IBOutlet weak var ClinicsCollectionView: UICollectionView!
    
    var arrTopVC = [UIImage(named: "doc7")!, UIImage(named: "doc6")!,UIImage(named: "doctor4")!]
    
    var arrClinics = [Clinic]()
    
    var timer : Timer?
    var currentCellIndex = 0
    
    func startTimer(){
        
        
        timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveToNextIndex), userInfo: nil, repeats: true)
    }
    
    
    @objc func moveToNextIndex(){
        
        if currentCellIndex < arrTopVC.count - 1 {
            currentCellIndex += 1
            
        }else{
            currentCellIndex = 0
            
            
        }
        TopCollectionView.scrollToItem(at: IndexPath(item: currentCellIndex, section: 0), at: .centeredHorizontally, animated: true)
        
        PageControl.currentPage = currentCellIndex
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ClinicsCollectionView.delegate = self
        ClinicsCollectionView.dataSource = self
        
        ClinicsCollectionView.backgroundColor = .systemBlue
        
        
        TopCollectionView.delegate = self
        TopCollectionView.dataSource = self
        
        PageControl.numberOfPages = arrTopVC.count
        
        startTimer()
        
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "tooth")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "kidney")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "heartIcon")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "tooth")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        
        
    }
    
       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          if collectionView == self.ClinicsCollectionView{
              
              return arrClinics.count
          }
          return arrTopVC.count
          
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          
          if collectionView == self.ClinicsCollectionView{
          let cell = ClinicsCollectionView.dequeueReusableCell(withReuseIdentifier: "ClinicCell", for: indexPath) as! ClinicsCollectionViewCell
          let data = arrClinics[indexPath.row]
          cell.setUpCell(photo: data.photo, name: data.name)
              return cell}
          else {
              let cell2 = TopCollectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as!TopCollectionViewCellHomePage
              
              cell2.TopImage.image = arrTopVC[indexPath.row]
               return cell2
          }
      }
      
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          if collectionView == self.ClinicsCollectionView {
              return CGSize(width: self.view.frame.width * 0.25, height: self.view.frame.width * 0.25)
          }
          else {
              return CGSize(width: TopCollectionView.frame.width, height: TopCollectionView.frame.width)
              
          }
      }
      
      
      
      func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
          if  collectionView == self.TopCollectionView {
              return 0
          }
          else {
              return 0
          }
          
      }
      
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = ClinicsCollectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerCell", for: indexPath) as! ClinicsCvHeader
        header.Header.text = "Categories"
        header.Header.textColor = .white

        return header
        
    }
    
    
    
    
    


}

struct Clinic {
    
    let photo : UIImage
    let name : String
    
}
