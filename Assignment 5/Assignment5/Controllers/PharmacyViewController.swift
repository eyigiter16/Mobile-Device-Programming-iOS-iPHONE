//
//  PharmacyViewController.swift
//  Assignment5
//
//  Created by Ekrem Yiğiter on 30.11.2021.
//

import UIKit

class PharmacyViewController: UIViewController {
    
    @IBOutlet weak var pharmacies: UITableView!
    
    var dataSource : DataSource?
    var selectedRegion : Region?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usleep(300000)
        if let dataSource = self.dataSource , let selectedRegion = self.selectedRegion {
            self.title = "Pharmacies of \(selectedRegion.Name)"
            dataSource.delegate = self
            dataSource.loadPharmacies(regionId: selectedRegion.Id)
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! PharmacyViewCell
        if let indexPath = self.pharmacies.indexPath(for: cell) , let dataSource = self.dataSource {
            let pharmacy = dataSource.getPharmacyWithIndex(index: indexPath.row.quotientAndRemainder(dividingBy: dataSource.getNumberOfPharmacies()).remainder)
            let pharmacyDetailViewController = segue.destination as! PharmacyDetailViewController
            pharmacyDetailViewController.selectedPharmacy = pharmacy
        }
    }
    

}

extension PharmacyViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataSource = self.dataSource {
            return dataSource.getNumberOfPharmacies()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pharmacyCell", for: indexPath) as! PharmacyViewCell
        
        if let dataSource = self.dataSource {
            let pharmacy = dataSource.getPharmacyWithIndex(index: indexPath.row.quotientAndRemainder(dividingBy: dataSource.getNumberOfPharmacies()).remainder)
            cell.pharmacyName.text = pharmacy.Name
        }
        return cell
    }
}

extension PharmacyViewController : DataSourceDelegate {
    func listLoaded() {
        self.pharmacies.reloadData()
    }
    
    func detailLoaded(pharmacy: PharmacyDetail) {}
    
    
}
