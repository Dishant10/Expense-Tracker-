//
//  TransactionListViewModel.swift
//  ExpenseTracker
//
//  Created by Dishant Nagpal on 29/04/22.
//

import Foundation
import Combine

final class TransactionListViewModel : ObservableObject{
    @Published var transactions : [Transaction] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    
    init(){
        getTransactions()
    }
    
    func getTransactions(){
        guard let url = URL(string: "https://designcode.io/data/transactions.json") else {
            print("Invalide URL")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { (data,response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse,httpResponse.statusCode == 200 else{
                    dump(response)
                    throw URLError(.badServerResponse)
                    
                }
                
                return data
            }
        
            .decode(type: [Transaction].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    print("Error fetching Transactions",error.localizedDescription)
                case .finished:
                    print("Finished Fetcing Transactions ")
                }
            } receiveValue: { [weak self] result in
                self?.transactions = result
                dump(self?.transactions)
            }
            .store(in: &cancellables)

        
    }
}
