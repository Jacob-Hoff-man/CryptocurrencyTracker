//
//  AllCoinsView.swift
//  CryptoTracker
//
//  Created by Jacob on 11/19/20.
//  Copyright © 2020 Jacob. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let currency: Currency
    @EnvironmentObject var currencies: Currencies
    
    init(_ currency: Currency) {
        self.currency = currency
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Section(header: Text("Overview").font(.largeTitle)) {
                    Spacer(minLength: 30)
                    Text("Ticker: \(self.currency.ticker)")
                    Text("Price: $\(self.currency.price, specifier: "%.2f")")
                    Text("Trade Volume: \(self.currency.tradeVolume)")
                    Text("Supply: \(self.currency.supply)")
                    Text("12-Hour Change: \(self.currency.twelveHrChange*100, specifier: "%.2f")%")
                    Text("24-Hour Change: \(self.currency.twentyFourHourChange*100, specifier: "%.2f")%")
                    Text("3-Day Change: \(self.currency.threeDayChange*100, specifier: "%.2f")%")
                    Text("7-Day Change: \(self.currency.sevenDayChange*100, specifier: "%.2f")%")
                    Text("1-Month Change: \(self.currency.oneMonthChange*100, specifier: "%.2f")%")
                }
                
                Spacer(minLength: 75)
                
                Section(header: Text("News").font(.largeTitle)) {
                    List(currency.newsArticles) { newsArticle in
                        HStack {
                            Text(newsArticle.title)
                            
                            Button(action: {
                                UIApplication.shared.open(URL(string: newsArticle.url)!)
                            }) {
                                Text("Read")
                                    .bold()
                                    .foregroundColor(Color.blue)
                                Image(systemName: "chevron.right")
                                    .font(.caption)
                                    .foregroundColor(Color.blue)
                            }
                            
                        }
                    }
                }
            }
            
        }
        .navigationBarTitle(self.currency.name)
        .navigationBarItems(trailing: Button(action: {
            if let index = self.currencies.currencies.firstIndex(where: { $0.id == self.currency.id }) {
                if self.currencies.currencies[index].favorited == true {
                    self.currencies.currencies[index].favorited = false
                    print("\(self.currency.name) unfavorited")
                } else {
                    self.currencies.currencies[index].favorited = true
                    print("\(self.currency.name) favorited")
                }
            }
            
        }) {
            if let index = self.currencies.currencies.firstIndex(where: {$0.id == self.currency.id }) {
                Image(systemName: "star").accentColor(self.currencies.currencies[index].favorited ? Color.yellow : Color.blue)
            }
        })
    }
}

struct AllCoinsList: View {
    let currencies: [Currency]
    let sortSelection: String
    
    init(_ currencies: [Currency], _ sortSelection: String) {
        self.sortSelection = sortSelection
        
        if sortSelection == "Name" {
            self.currencies = currencies.sorted { $0.name < $1.name }
        } else if sortSelection == "Ticker" {
            self.currencies = currencies.sorted { $0.ticker < $1.ticker }
        } else if sortSelection == "Trade Volume" {
            self.currencies = currencies.sorted { $0.tradeVolume < $1.tradeVolume }
        } else if sortSelection == "Price" {
            self.currencies = currencies.sorted { $0.price < $1.price }
        } else if sortSelection == "Supply" {
            self.currencies = currencies.sorted { $0.supply < $1.supply }
        } else if sortSelection == "12-Hour Change" {
            self.currencies = currencies.sorted { $0.twelveHrChange < $1.twelveHrChange }
        } else if sortSelection == "24-Hour Change" {
            self.currencies = currencies.sorted { $0.twentyFourHourChange < $1.twentyFourHourChange }
        } else if sortSelection == "3-Day Change" {
            self.currencies = currencies.sorted { $0.threeDayChange < $1.threeDayChange }
        } else if sortSelection == "7-Day Change" {
            self.currencies = currencies.sorted { $0.sevenDayChange < $1.sevenDayChange }
        } else if sortSelection == "1-Month Change" {
            self.currencies = currencies.sorted { $0.oneMonthChange < $1.oneMonthChange }
        } else {
            self.currencies = currencies
        }
    }
    
    var body: some View {
        if sortSelection == "Name" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Name")
                    Spacer()
                    Text("Price")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("\(currency.name)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                        }
                    }
                }
            }
        }
            
        else if sortSelection == "Ticker" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Name")
                    Spacer()
                    Text("Price")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("\(currency.name)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                        }
                    }
                }
            }
        }
            
        else if sortSelection == "Trade Volume" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Price")
                    Spacer()
                    Text("Volume")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                            Spacer()
                            Text("\(currency.tradeVolume)")
                        }
                    }
                }
            }
        }
            
        else if sortSelection == "Price" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Name")
                    Spacer()
                    Text("Price")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("\(currency.name)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                        }
                    }
                }
            }
        }
            
        else if sortSelection == "Supply" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Price")
                    Spacer()
                    Text("Supply")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                            Spacer()
                            Text("\(currency.supply)")
                        }
                    }
                }
            }
        }
            
        else if sortSelection == "12-Hour Change" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Price")
                    Spacer()
                    Text("12-Hour")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                            Spacer()
                            Text("\(currency.twelveHrChange*100, specifier: "%.2f")%")
                        }
                    }
                }
            }
        }
            
        else if sortSelection == "24-Hour Change" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Price")
                    Spacer()
                    Text("24-Hour")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                            Spacer()
                            Text("\(currency.twentyFourHourChange*100, specifier: "%.2f")%")
                        }
                    }
                }
            }
        }
            
        else if sortSelection == "3-Day Change" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Price")
                    Spacer()
                    Text("3-Day")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                            Spacer()
                            Text("\(currency.threeDayChange*100, specifier: "%.2f")%")
                        }
                    }
                }
            }
        }
            
        else if sortSelection == "7-Day Change" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Price")
                    Spacer()
                    Text("7-Day")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                            Spacer()
                            Text("\(currency.sevenDayChange*100, specifier: "%.2f")%")
                        }
                    }
                }
            }
        }
            
        else if sortSelection == "1-Month Change" {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Price")
                    Spacer()
                    Text("1-Month")
                }
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                            Spacer()
                            Text("\(currency.oneMonthChange*100, specifier: "%.2f")%")
                        }
                    }
                }
            }
        }
            
        else {
            return VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Name")
                    Spacer()
                    Text("Price")
                }
                
                List(self.currencies) { currency in
                    NavigationLink(destination: DetailView(currency)) {
                        HStack {
                            Text("\(currency.ticker)")
                            Spacer()
                            Text("\(currency.name)")
                            Spacer()
                            Text("$\(currency.price, specifier: "%.2f")")
                        }
                    }
                }
            }
        }
    }
}

struct AllCoinsView: View {
    private var sortOptions = ["Name", "Ticker", "Trade Volume", "Price", "Supply", "12-Hour Change", "24-Hour Change", "3-Day Change", "7-Day Change", "1-Month Change"]
    @State private var sortSelection = "Name"
    let currencies : [Currency]
    
    init(_ currencies: [Currency]) {
        self.currencies = currencies
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("Sort By:", selection: $sortSelection) {
                    ForEach(sortOptions, id: \.self) {
                        Text("\($0)")
                    }
                }
                
                Spacer()
                
                AllCoinsList(self.currencies, self.sortSelection)
        
            }
            .navigationBarTitle("All Cryptocurrencies")
        }
    }
    
}


