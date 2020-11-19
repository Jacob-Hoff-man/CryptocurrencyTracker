//
//  FavoritesListView.swift
//  CryptoTracker
//
//  Created by Jacob on 11/19/20.
//  Copyright © 2020 Jacob. All rights reserved.
//

import SwiftUI

struct FavoritesListView: View {
    @EnvironmentObject var currencies: Currencies
    
    func removeFavorite(at offsets: IndexSet) {
        var temp = self.currencies.currencies.filter { $0.favorited }
        temp.remove(atOffsets: offsets)
        for currency in self.currencies.currencies {
            if !temp.contains(currency) {
                if currency.favorited {
                    if let index = self.currencies.currencies.firstIndex(where: { $0.id == currency.id }) {
                        self.currencies.currencies[index].favorited = false
                        print("\(self.currencies.currencies[index].name) un-favorited")
                    }
                }
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Name")
                    Spacer()
                    Text("Price")
                }
            List {
                ForEach(self.currencies.currencies.filter {$0.favorited} ) { currency in
                    HStack {
                        Text("\(currency.ticker)")
                        Spacer()
                        Text("\(currency.name)")
                        Spacer()
                        Text("$\(currency.price, specifier: "%.2f")")
                    }
                }
                .onDelete(perform: removeFavorite)
            }
                
            }
            .navigationBarTitle("Favorites List")
            .navigationBarItems(leading: EditButton())
        }
        
    }
}
