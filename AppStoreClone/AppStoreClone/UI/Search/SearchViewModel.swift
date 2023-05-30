//
//  SearchViewModel.swift
//  AppStoreClone
//
//  Created by SeYeong on 2023/05/28.
//

import Foundation

import Combine

final class SearchViewModel: ObservableObject {

    private var cancellables: Set<AnyCancellable> = .init()
    private let apiManager = APIManager()

    @Published private(set) var searchResult: [SearchResult] = []

    let searchBarText = PassthroughSubject<String, Error>()

    func searchText(with text: String) {
        apiManager.getAppStore(text)
            .decode(type: SearchResponse.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion {
                case .finished:
                    return
                case .failure(let error):
                    print(error)
                }
            } receiveValue: { [weak self] response in
                self?.searchResult = response.results
            }.store(in: &cancellables)
    }
}
