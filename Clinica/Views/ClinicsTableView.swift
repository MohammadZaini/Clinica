//
//  ClinicsTableView.swift
//  Clinica
//
//  Created by HTU on 8/25/22.
//  Copyright © 2022 HTU. All rights reserved.
//

import UIKit

class ClinicsTableView: UIViewController ,UITableViewDataSource , UITableViewDelegate {
    
    var arrClinicsSection = ["First Clinic","Second Clinic","Third Clinic"]
    var arrClinicsRows = [["Doctor's Name","Clinic's Number","Location","Reviews","Book an appointment"],["Doctor's Name","Clinic's Number","Location","Reviews","Book an appointment"],["Doctor's Name","Clinic's Number","Location","Reviews","Book an appointment"]]
    
    
    @IBOutlet weak var ClinicsTableView: UITableView!
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return arrClinicsSection[section]
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrClinicsSection.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return arrClinicsRows[section].count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ClinicsTableView.dequeueReusableCell(withIdentifier: "ClinicCell", for: indexPath)
        cell.textLabel?.text = arrClinicsRows[indexPath.section][indexPath.row]
        cell.backgroundColor = .darkGray
        return  cell
    }
    
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ClinicsTableView.delegate = self
        ClinicsTableView.dataSource = self
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
