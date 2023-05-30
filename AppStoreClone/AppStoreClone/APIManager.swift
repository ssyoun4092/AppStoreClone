//
//  APIManager.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/23.
//

import Foundation

import Combine

final class APIManager {
    func getAppStore(_ search: String) -> AnyPublisher<Data, Error> {
        let url = URL(string: "https://itunes.apple.com/search?term=\(search)&country=kr&entity=software")!

        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { $0.data }
            .eraseToAnyPublisher()
    }
}
