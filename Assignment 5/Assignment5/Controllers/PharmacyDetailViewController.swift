//
//  PharmacyDetailViewController.swift
//  Assignment5
//
//  Created by Ekrem Yiğiter on 30.11.2021.
//

import UIKit

class PharmacyDetailViewController: UIViewController {

    @IBOutlet weak var pharmacyName: UILabel!
    @IBOutlet weak var pharmacyPhone: UILabel!
    @IBOutlet weak var pharmacyAdress: UILabel!
    
    var dataSource = DataSource()
    var selectedPharmacy : Pharmacy?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usleep(300000)
        self.title = "\(selectedPharmacy!.Name)"
        dataSource.delegate = self
        dataSource.loadPharmacyDetail(pharmacyId: selectedPharmacy!.Id)
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

extension PharmacyDetailViewController : DataSourceDelegate {
    func listLoaded() {}
    
    func detailLoaded(pharmacy: PharmacyDetail) {
        self.title = dataSource.pharmacyDetail?.Name
        pharmacyName.text = pharmacy.Name
        pharmacyAdress.text = pharmacy.Address
        pharmacyPhone.text = pharmacy.Phone
    }
}
