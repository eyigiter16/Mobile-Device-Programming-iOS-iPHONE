//
//  DataSource.swift
//  Assignment5
//
//  Created by Ekrem Yiğiter on 30.11.2021.
//

import Foundation

class DataSource {
    var cities : [City] = []
    var regions : [Region] = []
    var pharmacies : [Pharmacy] = []
    var pharmacyDetail : PharmacyDetail?
    
    var delegate : DataSourceDelegate?
    
    let baseUrl = "https://koc.api.staging.tarentum.io"
    
    init() {
    }
    
    func getNumberOfCities() -> Int {
        return cities.count
    }
    
    func getCityWithIndex(index : Int) -> City {
        return cities[index]
    }
    
    func getNumberOfRegions() -> Int {
        return regions.count
    }
    
    func getRegionWithIndex(index : Int) -> Region {
        return regions[index]
    }
    
    func getNumberOfPharmacies() -> Int {
        return pharmacies.count
    }
    
    func getPharmacyWithIndex(index : Int) -> Pharmacy {
        return pharmacies[index]
    }
    
    func loadCities() {
        if let url = URL(string: "\(baseUrl)/city") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, request, error in
                let decoder = JSONDecoder()
                if let data = data {
                    let cityListLoading = try! decoder.decode([City].self, from: data)
                    self.cities = cityListLoading
                    DispatchQueue.main.async {
                        self.delegate?.listLoaded()                    }
                }
            }
            dataTask.resume()
        }
    }
    

    
    func loadRegions(cityId : Int) {
        if let url = URL(string: "\(baseUrl)/city/\(cityId)/region") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, request, error in
                let decoder = JSONDecoder()
                if let data = data {
                    let regionListLoading = try! decoder.decode([Region].self, from: data)
                    self.regions = regionListLoading
                    DispatchQueue.main.async {
                        self.delegate?.listLoaded()                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func loadPharmacies(regionId : String) {
        if let url = URL(string: "\(baseUrl)/region/\(regionId)/pharmacy") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, request, error in
                let decoder = JSONDecoder()
                if let data = data {
                    let pharmacyListLoading = try! decoder.decode([Pharmacy].self, from: data)
                    self.pharmacies = pharmacyListLoading
                    DispatchQueue.main.async {
                        self.delegate?.listLoaded()                    }
                }
            }
            dataTask.resume()
        }
    }
    
    func loadPharmacyDetail(pharmacyId : String) {
        if let url = URL(string: "\(baseUrl)/pharmacy/\(pharmacyId)") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue("application/JSON", forHTTPHeaderField: "Content-Type")
            let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, request, error in
                let decoder = JSONDecoder()
                if let data = data {
                    let pharmacyLoading = try! decoder.decode(PharmacyDetail.self, from: data)
                    self.pharmacyDetail = pharmacyLoading
                    DispatchQueue.main.async {
                        self.delegate?.detailLoaded(pharmacy: pharmacyLoading)                    }
                }
            }
            dataTask.resume()
        }
    }
}
