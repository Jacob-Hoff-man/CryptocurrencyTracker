//
//  InvestmentsView.swift
//  CryptoTracker
//
//  Created by Jacob on 11/19/20.
//  Copyright © 2020 Jacob. All rights reserved.
//

import SwiftUI

struct AddInvestmentView: View {
    private var currencies: Currencies
    @State private var ticker = ""
    @State private var buyPrice = ""
    @State private var quantity = ""
    @State private var showInvalidInvestmentAlert = false
    
    @Environment(\.presentationMode) var presentationMode
    
    init(_ currencies: Currencies) {
        self.currencies = currencies
    }
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Currency Ticker", text: $ticker)
                TextField("Quantity", text: $quantity).keyboardType(UIKeyboardType.numberPad)
                TextField("Buy Price", text: $buyPrice).keyboardType(UIKeyboardType.decimalPad)
            }
            .navigationBarTitle("Add Investment")
            .navigationBarItems(leading: Button("Back") { self.presentationMode.wrappedValue.dismiss() },
                                trailing: Button("Add") {
                                    if let actualQuantity = Int(self.quantity), let actualBuyPrice = Double(self.buyPrice), let index = self.currencies.currencies.firstIndex(where: { $0.ticker == self.ticker.uppercased() }) {
                                        var currency = self.currencies.currencies[index]
                                        currency.buyPrice = actualBuyPrice
                                        currency.quantity = actualQuantity
                                        self.currencies.investments.append(currency)
                                        self.presentationMode.wrappedValue.dismiss()
                                        
                                    } else {
                                        self.showInvalidInvestmentAlert = true
                                    }
                })
                .alert(isPresented: $showInvalidInvestmentAlert) {
                    Alert(title: Text("Invalid Investment Entry."),
                          message: Text("Make sure the ticker, quantity, and price are valid."),
                          dismissButton: .default(Text("OK")) {
                            self.showInvalidInvestmentAlert = false
                        })
            }
        }
    }
}

struct InvestmentsView: View {
    @EnvironmentObject var currencies: Currencies
    @State private var showingAddView = false
    
    func removeInvestment(at offsets: IndexSet) {
        self.currencies.investments.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Ticker")
                    Spacer()
                    Text("Quantity")
                    Spacer()
                    Text("% Gain/Loss")
                }
            List {
                ForEach(self.currencies.investments) { currency in
                    HStack {
                        Text("\(currency.ticker)")
                        Spacer()
                        Text("\(currency.quantity!)")
                        Spacer()
                        Text("\(((currency.price-currency.buyPrice!)/currency.buyPrice!)*100, specifier: "%.2f")%")
                    }
                }
                .onDelete(perform: removeInvestment)
            }
                .navigationBarTitle("Investments List")
                .navigationBarItems(leading: EditButton(),
                                    trailing:
                    Button(action: {
                        self.showingAddView = true
                    }) {
                        Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $showingAddView) {
                AddInvestmentView(self.currencies)
            }
        }
    }
}

