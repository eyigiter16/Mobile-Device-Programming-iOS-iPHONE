//
//  CityViewController.swift
//  Assignment5
//
//  Created by Ekrem Yiğiter on 30.11.2021.
//

import UIKit

class CityViewController: UIViewController {
    
    @IBOutlet weak var cities: UITableView!
    
    var dataSource = DataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "City List"
        dataSource.delegate = self
        dataSource.loadCities()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let cell = sender as! CityViewCell
        if let indexPath = self.cities.indexPath(for: cell) {
            let city = dataSource.getCityWithIndex(index: indexPath.row.quotientAndRemainder(dividingBy: dataSource.getNumberOfCities()).remainder)
            let regionViewController = segue.destination as! RegionViewController
            regionViewController.selectedCity = city
            regionViewController.dataSource = self.dataSource
        }
    }
}

extension CityViewController : DataSourceDelegate {
    func listLoaded() {
        self.cities.reloadData()
    }
    
    func detailLoaded(pharmacy: PharmacyDetail) {}
    
    
}

extension CityViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.getNumberOfCities()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath) as! CityViewCell
        let city = dataSource.getCityWithIndex(index: indexPath.row.quotientAndRemainder(dividingBy: dataSource.getNumberOfCities()).remainder)
        
        cell.cityName.text = city.Name
        
        return cell
    }
}
