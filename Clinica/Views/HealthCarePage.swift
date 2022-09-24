//
//  HealthCarePage.swift
//  Clinica
//
//  Created by HTU on 8/24/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class HealthCarePage: UIViewController, UITableViewDelegate , UITableViewDataSource {
    
    var arrHealthCare = ["Covid-19","Headache","Stomach Cramps","Nose Bleeding","Flu","Insomina"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrHealthCare.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = HealthCareTableView.dequeueReusableCell(withIdentifier: "HealthCareCell", for: indexPath)
        cell.textLabel?.text = arrHealthCare[indexPath.row]
        
        cell.textLabel?.textColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         return 70
     }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "Covid19")  as! CovidVC
            
            self.navigationController?.pushViewController(storyboard, animated: true)
            
        }else if indexPath.row == 1 {
            
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "Headache")  as! HeadacheVC
            
            self.navigationController?.pushViewController(storyboard, animated: true)
            
        }else if indexPath.row == 2 {
            let storyboard = self.storyboard?.instantiateViewController(withIdentifier: "Stomache")  as! StomacheCrampsVC
            
            self.navigationController?.pushViewController(storyboard, animated: true)
            
            
        }
        
        
    }
    
    

    @IBOutlet weak var HealthCareTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        HealthCareTableView.delegate = self
        HealthCareTableView.dataSource = self
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
