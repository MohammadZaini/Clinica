//
//  DentistryTableView.swift
//  Clinica
//
//  Created by htu on 11/09/2022.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class DentistryTableView: UIViewController , UITableViewDelegate , UITableViewDataSource {
    var DentistryArray = [DentistryClinics]()
    
    @IBOutlet weak var DentistryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        DentistryTableView.delegate = self
        DentistryTableView.dataSource = self
        
        DentistryArray.append(DentistryClinics.init(DocImage: UIImage(systemName: "person")!, TeleImage: UIImage(systemName: "teletype")!, LocImg: UIImage(systemName: "location.fill")!, WorkingHImage: UIImage(systemName: "clock")!, AppointImage: UIImage(systemName:"calendar")!, RevImage: UIImage(systemName: "doc.text.fill")!, DocName: "Dr.Rashed", teleNum: 0799988442, LocLabel: "Marj-Alhamam", WorkingHLabel: "9-5", AppointLabel: "Book an appointment", RevLabel: "Leave a review"))
        
        DentistryArray.append(DentistryClinics.init(DocImage: UIImage(systemName: "person")!, TeleImage: UIImage(systemName: "teletype")!, LocImg: UIImage(systemName: "location.fill")!, WorkingHImage: UIImage(systemName: "clock")!, AppointImage: UIImage(systemName:"calendar")!, RevImage: UIImage(systemName: "doc.text.fill")!, DocName: "Dr.Ahmad", teleNum: 0799988442, LocLabel: "Swaileh", WorkingHLabel: "9-5", AppointLabel: "Book an appointment", RevLabel: "Leave a review"))
        
        DentistryArray.append(DentistryClinics.init(DocImage: UIImage(systemName: "person")!, TeleImage: UIImage(systemName: "teletype")!, LocImg: UIImage(systemName: "location.fill")!, WorkingHImage: UIImage(systemName: "clock")!, AppointImage: UIImage(systemName:"calendar")!, RevImage: UIImage(systemName: "doc.text.fill")!, DocName: "Dr.Nader", teleNum: 0799988442, LocLabel: "Rabyiah", WorkingHLabel: "9-5", AppointLabel: "Book an appointment", RevLabel: "Leave a review"))
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DentistryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DentistryTableView.dequeueReusableCell(withIdentifier: "DentistryCell", for: indexPath) as! DentistryTVCell
        
        let data = DentistryArray[indexPath.row]
        cell.setUpCell(firstImage: data.DocImage, secondImage: data.TeleImage, thirdImage: data.LocImg, ForthImage: data.WorkingHImage, FifthImage: data.AppointImage, SixthImage: data.RevImage, firstLabel: data.DocName, SecondLabel: data.teleNum, ThirdLabel: data.LocLabel, ForthLabel: data.WorkingHLabel, FifthLabel: data.AppointLabel, SixthLabel: data.RevLabel)
        return cell
    }
    
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }*/
    

   

}

struct DentistryClinics{
    
    let DocImage : UIImage
    let TeleImage : UIImage
    let LocImg : UIImage
    let WorkingHImage : UIImage
    let AppointImage : UIImage
    let RevImage : UIImage
    
    let DocName : String
    let teleNum : Int
    let LocLabel : String
    let WorkingHLabel : String
    let AppointLabel : String
    let RevLabel : String
    
}
