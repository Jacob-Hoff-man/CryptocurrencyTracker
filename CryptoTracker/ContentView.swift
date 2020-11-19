//
//  ContentView.swift
//  CryptoTracker
//
//  Created by Jacob on 11/19/20.
//  Copyright © 2020 Jacob. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var currencies: Currencies
    
    var body: some View {
        
        TabView {
            AllCoinsView(currencies.currencies)
                .padding()
                .tabItem {
                    Image(systemName: "house")
                    Text("All Coins")
            }
            
            FavoritesListView()
                .padding()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites List")
            }
            
            InvestmentsView()
                .padding()
                .tabItem {
                    Image(systemName: "creditcard")
                    Text("Investments")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
