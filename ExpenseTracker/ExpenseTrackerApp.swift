//
//  ExpenseTrackerApp.swift
//  ExpenseTracker
//
//  Created by Dishant Nagpal on 29/04/22.
//

import SwiftUI

@main
struct ExpenseTrackerApp: App {
  @StateObject  var transactionListVM = TransactionListViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
