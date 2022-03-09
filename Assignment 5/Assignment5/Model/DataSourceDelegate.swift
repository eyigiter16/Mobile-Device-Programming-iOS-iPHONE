//
//  DataSourceDelegate.swift
//  Assignment5
//
//  Created by Ekrem Yiğiter on 30.11.2021.
//

import Foundation

protocol DataSourceDelegate {
    func listLoaded()
    func detailLoaded(pharmacy : PharmacyDetail)
}
