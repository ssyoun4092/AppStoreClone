//
//  APIManager.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/23.
//

import Foundation

import Combine

final class APIManager {
    func getAppStore(_ search: String) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(search)&country=kr&entity=software") else {
            return
        }
//        URLSession.shared.dataTaskPublisher(for: url)
//            .sink { error in
//                print(error)
//            } receiveValue: { data, response in
//                let decodedData = JSONDecoder().decode(<#T##type: Decodable.Protocol##Decodable.Protocol#>, from: data)
//            }

    }
}
