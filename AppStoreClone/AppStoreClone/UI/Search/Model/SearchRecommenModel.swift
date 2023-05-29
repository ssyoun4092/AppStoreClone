//
//  SearchRecommenModel.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/29.
//

import Foundation

struct SearchRecommendModel: Hashable, Codable {
    var id = UUID()
    var imageString: String?
    var title: String
    var description: String
    var hasInAppPurchase: Bool
}

extension SearchRecommendModel {
    static var mock: [SearchRecommendModel] = [
        .init(imageString: nil, title: "Helix Jump", description: "캐주얼", hasInAppPurchase: true),
        .init(imageString: nil, title: "Notion - notes, docs, tasks", description: "The all-in-one workspace", hasInAppPurchase: false),
        .init(imageString: nil, title: "Piano Tiles 2", description: "Don't Tap The White Tile 2", hasInAppPurchase: true),
        .init(imageString: nil, title: "토킹톰 골드런", description: "최고의 고양이 러닝 액션 게임!", hasInAppPurchase: true),
        .init(imageString: nil, title: "Rummikub", description: "사람들을한데 모으기", hasInAppPurchase: true),
        .init(imageString: nil, title: "월간엔터테인먼트", description: "월간아이돌2: 최고의 KPOP 아티스트 키우기", hasInAppPurchase: true),
        .init(imageString: nil, title: "숩숩", description: "숨은그림찾기 일러스트 매거진", hasInAppPurchase: true),
        .init(imageString: nil, title: "스와이프 벽돌깨기", description: "무한반복도전 집콕게임", hasInAppPurchase: true),
        .init(imageString: nil, title: "주차의 달인 4", description: "시뮬레이션", hasInAppPurchase: true),
        .init(imageString: nil, title: "Roblox", description: "수천만 가지 체험과의 만남", hasInAppPurchase: true),
        .init(imageString: nil, title: "수도쿠 - 클래스 로직 퍼즐 게임", description: "두뇌게임: 브레인 퍼즐을 푸세요", hasInAppPurchase: true),
    ]
}
