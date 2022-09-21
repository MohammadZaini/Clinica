//
//  HomePage.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit
import FirebaseAuth

class HomePage: UIViewController ,UICollectionViewDelegate ,UICollectionViewDataSource , UICollectionViewDelegateFlowLayout, UITableViewDelegate , UITableViewDataSource {
    var arrSideMenu = ["Profile","Settings","Sign Out"]
    var arrSideMenuImages = [UIImage(systemName: "person")!, UIImage(systemName: "command")!,UIImage(systemName:"arrowshape.turn.up.backward")!]
    var isSideMenuOpen : Bool = false
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrSideMenu.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = sideMenuTableView.dequeueReusableCell(withIdentifier: "sideCell", for: indexPath) as! SideMenuTVCell
        cell.sideMenuImage.image = arrSideMenuImages[indexPath.row]
        cell.sideMenuLabel.text = arrSideMenu[indexPath.row]
        cell.sideMenuLabel.textColor = .white
        //cell.backgroundColor = .purple
        cell.tintColor = .white
        return   cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       /* if indexPath.row == 0 {
            let profile : ProfilePage = self.storyboard?.instantiateViewController(withIdentifier: "Profile") as! ProfilePage
            self.navigationController?.pushViewController(profile, animated: true)*/
        
        if indexPath.row == 0 {
        let vc = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.vc) as? ProfilePage
            self.view.window?.rootViewController = vc
            self.view.window?.makeKeyAndVisible()
        
        }
        
        else if indexPath.row == 1 {
            
            let settings = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.settings) as? SettingPage
                self.view.window?.rootViewController = settings
                self.view.window?.makeKeyAndVisible()
            
            
            /*let profile : ClinicsTableViewNew = self.storyboard?.instantiateViewController(withIdentifier: "Segue") as! ClinicsTableViewNew
            self.navigationController?.pushViewController(profile, animated: true)*/
        }else if indexPath.row == 2 {

            
            let appointments = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.BookingAppointments) as? BookingAppointmentsPage
                self.view.window?.rootViewController = appointments
                self.view.window?.makeKeyAndVisible()
            
        
        }
            
            //self.performSegue(withIdentifier: "theSegue", sender: self)
            
            
        }
    
    
    
    @IBAction func sideMenuButton(_ sender: UIButton) {
        
        sideMenuView.isHidden = false
        sideMenuTableView.isHidden = false
        self.view.bringSubviewToFront(sideMenuView)
        
        if !isSideMenuOpen {
            isSideMenuOpen = true
            sideMenuView.frame = CGRect(x: 0, y: 56, width: 311, height: 632)
            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 311, height: 757)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil )
            sideMenuView.frame = CGRect(x: 0, y: 56, width: 311, height: 757)
            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 311, height: 757)
            UIView.commitAnimations()
            
        }else{
            sideMenuView.isHidden = true
            sideMenuTableView.isEditing = true
            isSideMenuOpen = false
            sideMenuView.frame = CGRect(x: 0, y: 56, width: 311, height: 757)
            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 311, height: 757)
            UIView.setAnimationDuration(0.3)
            UIView.setAnimationDelegate(self)
            UIView.beginAnimations("TableAnimation", context: nil )
            sideMenuView.frame = CGRect(x: 0, y: 56, width: 311, height: 757)
            sideMenuTableView.frame = CGRect(x: 0, y: 0, width: 311, height: 757)
            UIView.commitAnimations()
            
            
            
            
        }
        
        
    }
    
    
    @IBOutlet weak var TopCollectionView: UICollectionView!
    
    @IBOutlet weak var PageControl: UIPageControl!
    
    @IBOutlet weak var ClinicsCollectionView: UICollectionView!
    @IBOutlet weak var sideMenuView: UIView!
    
    @IBOutlet weak var sideMenuTableView: UITableView!
    var arrTopVC = [UIImage(named: "doctor3")!, UIImage(named: "doc6")!,UIImage(named: "doctor4")!]
    
    var timer : Timer?

    var arrClinics = [Clinic]()
    
    var currentCellIndex = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ClinicsCollectionView.delegate = self
        ClinicsCollectionView.dataSource = self
        
        ClinicsCollectionView.isUserInteractionEnabled = true
        TopCollectionView.isUserInteractionEnabled = false
 
    
        
    
        
        startTimer()
        PageControl.numberOfPages = arrTopVC.count
        
        ClinicsCollectionView.backgroundColor = .systemBlue
        
        
        TopCollectionView.delegate = self
        TopCollectionView.dataSource = self
       
        
        
        sideMenuTableView.delegate = self
        sideMenuTableView.dataSource = self
        sideMenuView.isHidden = true
        //sideMenuTableView.backgroundColor = UIColor.groupTableViewBackground
        isSideMenuOpen = false
        sideMenuView.layer.cornerRadius = 15
        //sideMenuTableView.backgroundColor = .purple
        
        
        
        
        
        arrClinics.append(Clinic(photo: UIImage(named: "Eye")!, name: "ophthalmology") )
        arrClinics.append(Clinic(photo: UIImage(named: "tooth")!, name: "Dentistry") )
        arrClinics.append(Clinic(photo: UIImage(named: "kidney")!, name: "Nephrology") )
        arrClinics.append(Clinic(photo: UIImage(named: "heartIcon")!, name: "Cardiology") )
        arrClinics.append(Clinic(photo: UIImage(named: "Ear")!, name: "Otology") )
        arrClinics.append(Clinic(photo: UIImage(named: "bone")!, name: "Orthopedics") )
        
        
    }

    
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
        if  collectionView == self.ClinicsCollectionView {
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
    
    

    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
      
            print("it is working sdf")
        
          if collectionView == self.ClinicsCollectionView{
           
           print("working!!!")
              if indexPath.row == 0 {
                  //performSegue(withIdentifier: "theTestSegue", sender: self)
                 /* if let vc = storyboard?.instantiateViewController(withIdentifier: "theTestSegue") as? ClinicsTableViewNew {
                       self.navigationController?.pushViewController(vc, animated: true)*/
                      
                      let clinics1 = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.Clinics) as? ClinicsTableViewNew
                          self.view.window?.rootViewController = clinics1
                          self.view.window?.makeKeyAndVisible()
                  
              }else if indexPath.row == 1{
                  let clinics2 = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.dentalClinics) as? DentistryTableView
                      self.view.window?.rootViewController = clinics2
                      self.view.window?.makeKeyAndVisible()
                  
              }
              
              
            
            
           
                
           }
            
            /*if indexPath.row == 0 {
                
                
                print("It is working!!")
                 
                
               if let vc = storyboard?.instantiateViewController(withIdentifier: "mySegue1") as? ClinicsTableViewNew {
                    self.navigationController?.pushViewController(vc, animated: true)
                    
                }
                }*/
            
            
                /*let vc = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.vc) as? ProfilePage
                    self.view.window?.rootViewController = vc
                    self.view.window?.makeKeyAndVisible()*/
                
                
                //performSegue(withIdentifier: "Segue1", sender: self)
                
                
                /*let VCv = storyboard?.instantiateViewController(withIdentifier: "Segue1") as! ClinicsTableViewNew
                self.navigationController?.pushViewController(VCv, animated: true)
                
            view.window?.rootViewController = VCv
            view.window?.makeKeyAndVisible()*/
        
            }
        }
    
   
         
    
  /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue"{
            
            let vc = segue.destination as! ClinicsTableViewNew
            
        }
            
    
    }*/
    
        
   
  

struct Clinic {
    
    let photo : UIImage
    let name : String
    
}




