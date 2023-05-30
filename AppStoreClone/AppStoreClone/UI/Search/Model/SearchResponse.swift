//
//  SearchResponse.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/29.
//

import Foundation

// MARK: - Welcome
struct SearchResponse: Codable {
    let resultCount: Int
    let results: [SearchResult]
}

// MARK: - Result
struct SearchResult: Codable {
    let features: [String]
    let advisories: [String]
    let isGameCenterEnabled: Bool
    let ipadScreenshotUrls: [String]
    let appletvScreenshotUrls: [String]
    let artistViewURL: String
    let artworkUrl60, artworkUrl512, artworkUrl100: String
    let screenshotUrls: [String]
    let supportedDevices: [String]
    let kind: String
    let artistID: Int
    let artistName: String
    let genres: [String]
    let price: Double?
    let description: String
    let genreIDS: [String]
    let bundleID: String
    let isVppDeviceBasedLicensingEnabled: Bool
    let sellerName: String
    let releaseDate: String
    let releaseNotes: String?
    let primaryGenreName: String
    let primaryGenreID: Int
    let currentVersionReleaseDate: String
    let currency, contentAdvisoryRating: String
    let formattedPrice: String?
    let averageUserRatingForCurrentVersion: Double
    let userRatingCountForCurrentVersion: Int
    let averageUserRating: Double
    let trackContentRating, minimumOSVersion, trackCensoredName: String
    let languageCodesISO2A: [String]
    let fileSizeBytes: String
    let sellerURL: String?
    let trackViewURL: String
    let trackID: Int
    let trackName, version, wrapperType: String
    let userRatingCount: Int

    enum CodingKeys: String, CodingKey {
        case features, advisories, isGameCenterEnabled, ipadScreenshotUrls, appletvScreenshotUrls
        case artistViewURL = "artistViewUrl"
        case artworkUrl60, artworkUrl512, artworkUrl100, screenshotUrls, supportedDevices, kind
        case artistID = "artistId"
        case artistName, genres, price, description
        case genreIDS = "genreIds"
        case bundleID = "bundleId"
        case isVppDeviceBasedLicensingEnabled, sellerName, releaseDate, releaseNotes, primaryGenreName
        case primaryGenreID = "primaryGenreId"
        case currentVersionReleaseDate, currency, formattedPrice, contentAdvisoryRating, averageUserRatingForCurrentVersion, userRatingCountForCurrentVersion, averageUserRating, trackContentRating
        case minimumOSVersion = "minimumOsVersion"
        case trackCensoredName, languageCodesISO2A, fileSizeBytes
        case sellerURL = "sellerUrl"
        case trackViewURL = "trackViewUrl"
        case trackID = "trackId"
        case trackName, version, wrapperType, userRatingCount
    }
}

fileprivate enum Rating: String, Codable {
    case the12 = "12+"
    case the17 = "17+"
    case the4 = "4+"
    case the9 = "9+"
}

fileprivate enum Currency: String, Codable {
    case krw = "KRW"
}

fileprivate enum Feature: String, Codable {
    case gameCenter = "gameCenter"
    case iosUniversal = "iosUniversal"
}

fileprivate enum FormattedPrice: String, Codable {
    case 무료 = "무료"
}

fileprivate enum Kind: String, Codable {
    case software = "software"
}

fileprivate enum PrimaryGenreName: String, Codable {
    case entertainment = "Entertainment"
    case games = "Games"
    case photoVideo = "Photo & Video"
    case productivity = "Productivity"
    case sports = "Sports"
}
