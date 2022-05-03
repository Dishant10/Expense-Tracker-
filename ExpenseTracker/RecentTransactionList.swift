//
//  RecentTransactionList.swift
//  ExpenseTracker
//
//  Created by Dishant Nagpal on 29/04/22.
//

import SwiftUI

struct RecentTransactionList: View {
    
    @EnvironmentObject var transactionListVM:TransactionListViewModel
    
    var body: some View {
        VStack{
            HStack{
                //MARK:- Header Title
                Text("Recent Transactions")
                    .bold()
                Spacer()
                //MARK:- Header Link
                NavigationLink {
                    
                } label: {
                    HStack(spacing:4){
                        Text("See all")
                        Image(systemName: "chevron.right")
                        
                    }
                    .foregroundColor(Color.text)
                }

            }
            .padding(.top)
            
            //MARK:- Recent Transaction List
            ForEach(Array(transactionListVM.transactions.prefix(5).enumerated()), id:\.element) { index, transaction in
               TransactionRow(transaction: transaction)
                    .padding()
                Divider()
                    .opacity(index == 4 ? 0 : 1)
            }
        }
        .padding()
        .background(Color.systemBackground)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.primary.opacity(0.2), radius: 10, x: 0, y: 5)
        
    }
}

struct RecentTransactionList_Previews: PreviewProvider {
    
    
    static let transactionListVM:TransactionListViewModel = {
        let transactionListVM = TransactionListViewModel()
        transactionListVM.transactions = transactionListPreviewData
        return transactionListVM
    }()
    
    
    static var previews: some View {
        Group {
            RecentTransactionList()
                .environmentObject(transactionListVM)
            RecentTransactionList()
                .preferredColorScheme(.dark)
                .environmentObject(transactionListVM)
        }
    }
}
