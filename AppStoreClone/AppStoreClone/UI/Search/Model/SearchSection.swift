//
//  SearchSection.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/29.
//

import Foundation

enum SearchSection: Int, CaseIterable {
    case newDiscovery
    case recommendItem

    var title: String {
        switch self {
        case .newDiscovery:
            return "새로운 발견"
        case .recommendItem:
            return "추천 앱과 게임"
        }
    }
}
