//
//  UbikeViewModel.swift
//  Interview
//
//  Created by 陳韋綸 on 2023/10/12.
//

import Foundation

class UbikeViewModel {

    var selectedSearchIndex: Int = .zero

    var response: [UbikeModel] = [] {
        didSet {

            filterData = response

        }
    }

    var filterData: [UbikeModel] = []

    func getAllArea() -> [String] {
        let areas = response.compactMap({$0.sarea})
        return Array(Set(areas))
    }

    func bindstart(completion: @escaping () -> Void) {

        ApiServersModel().requestHttpServer { [weak self] (model: Result<[UbikeModel], Error>) in
            switch model {
            case .success(let success):
                self?.response = success
                completion()
            case .failure(let failure):
                print(failure)
            }
        }

    }

    func searchBindStart(area: String) {
        filterData = response.filter({$0.sarea == area})
    }

}
