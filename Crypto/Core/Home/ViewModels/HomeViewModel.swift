//
//  HomeViewModel.swift
//  Crypto
//
//  Created by Joseph Estrada on 12/6/22.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
     
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    private let dataService = CoinDataService()
    
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$allCoins
            .sink { [weak self] returnedCoins in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellable)
    }
    
}
