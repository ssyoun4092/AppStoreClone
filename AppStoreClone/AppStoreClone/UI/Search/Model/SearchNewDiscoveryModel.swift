//
//  SearchNewDiscoveryModel.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/29.
//

import Foundation

struct SearchNewDiscoveryModel: Hashable, Codable {
    var id = UUID()
    var title: String
}

extension SearchNewDiscoveryModel {
    static var mock: [SearchNewDiscoveryModel] = [
        .init(title: "영어단어"),
        .init(title: "배달"),
        .init(title: "농구게임"),
        .init(title: "만세력"),
        .init(title: "축구게임"),
        .init(title: "화면녹화"),
    ]
}
