//
//  RegionViewController.swift
//  Assignment5
//
//  Created by Ekrem Yiğiter on 30.11.2021.
//

import UIKit

class RegionViewController: UIViewController {
    
    
    @IBOutlet weak var regions: UITableView!
    
    var dataSource : DataSource?
    var selectedCity : City?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usleep(300000)
        if let dataSource = self.dataSource , let selectedCity = self.selectedCity {
            self.title = "Regions of \(selectedCity.Name)"
            dataSource.delegate = self
            dataSource.loadRegions(cityId: selectedCity.Id)
        }
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! RegionViewCell
        if let indexPath = self.regions.indexPath(for: cell) , let dataSource = dataSource{
            let region = dataSource.getRegionWithIndex(index: indexPath.row.quotientAndRemainder(dividingBy: dataSource.getNumberOfRegions()).remainder)
            let pharmacyViewController = segue.destination as! PharmacyViewController
            pharmacyViewController.selectedRegion = region
            pharmacyViewController.dataSource = dataSource
        }
    }
    

}

extension RegionViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let dataSource = dataSource {
            return dataSource.getNumberOfRegions()
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath) as! RegionViewCell
        if let dataSource = dataSource {
            let region = dataSource.getRegionWithIndex(index: indexPath.row.quotientAndRemainder(dividingBy: dataSource.getNumberOfRegions()).remainder)
            
            cell.regionName.text = region.Name
        }
        
        return cell
    }
}

extension RegionViewController : DataSourceDelegate {
    func listLoaded() {
        self.regions.reloadData()
    }
    
    func detailLoaded(pharmacy: PharmacyDetail) {}
    
    
}
