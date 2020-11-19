//
//  Currencies.swift
//  CryptoTracker
//
//  Created by Jacob on 11/16/20.
//  Copyright © 2020 Jacob. All rights reserved.
//

import Foundation

class Currencies: ObservableObject {
    @Published var currencies: [Currency] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(currencies) {
                UserDefaults.standard.set(encoded, forKey: "Currencies")
            }
        }
    }
    
    @Published var investments: [Currency] {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(investments) {
                UserDefaults.standard.set(encoded, forKey: "Investments")
            }
        }
    }

    //blank initializer is going to generate an array of type Currency filled with example data
    init() {
        var currency: Currency
        self.currencies = []
        self.investments = []
        
        if let investments = UserDefaults.standard.data(forKey: "Investments") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Currency].self, from: investments) {
                self.investments = decoded
            }
        }
        
        if let currencies = UserDefaults.standard.data(forKey: "Currencies") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Currency].self, from: currencies) {
                self.currencies = decoded
                print("loaded saved coin demo data")
                return
            }
        }
        
        print("Adding demo coin data to currencies array for the first time")
        currency = Currency(name: "Bitcoin",
                            ticker: "BTC",
                            tradeVolume: 28429605921,
                            price: 16683.39,
                            supply: 18538368,
                            twelveHrChange: 0.0069,
                            twentyFourHourChange: 0.0454,
                            threeDayChange: 0.0691,
                            sevenDayChange: 0.0981,
                            oneMonthChange: 0.1313,
                            newsArticles: [Currency.NewsArticle(title: "Bitcoin Evangelist Andreas Antonopoulos Plans to Testify in Billion-Dollar Bitcoin Lawsuit",
                                           url: "https://news.bitcoin.com/bitcoin-evangelist-andreas-antonopoulos-plans-to-testify-in-billion-dollar-bitcoin-lawsuit/")])
        
        self.currencies.append(currency)
        
        currency = Currency(name: "Ethereum",
                            ticker: "ETH",
                            tradeVolume: 10920477552,
                            price: 461.69,
                            supply: 113452728,
                            twelveHrChange: 0.0045,
                            twentyFourHourChange: 0.0235,
                            threeDayChange: 0.0369,
                            sevenDayChange: 0.0414,
                            oneMonthChange: 0.1069,
                            newsArticles:[Currency.NewsArticle(title: "ETH 2.0 benefits will come faster than people expect, Vitalik says in AMA",
                                           url: "https://cointelegraph.com/news/eth-2-0-benefits-will-come-faster-than-people-expect-vitalik-says-in-ama")])
        
        self.currencies.append(currency)
        
        currency = Currency(name: "XRP",
                            ticker: "XRP",
                            tradeVolume: 3814160993,
                            price: 0.286121,
                            supply: 45328155123,
                            twelveHrChange: 0.0177,
                            twentyFourHourChange: 0.0563,
                            threeDayChange: 0.0969,
                            sevenDayChange: 0.1466,
                            oneMonthChange: 0.2069,
                            newsArticles: [Currency.NewsArticle(title: "Ripple: New bull cycle may push XRP price to $0.92 – Analyst",
                                            url: "https://www.crypto-news-flash.com/ripple-new-bull-cycle-may-push-xrp-price-to-usd-0-92-analyst/")])
        
        self.currencies.append(currency)
        
        currency = Currency(name: "Litecoin",
                            ticker: "LTC",
                            tradeVolume: 4853952196,
                            price: 71.85,
                            supply: 65895172,
                            twelveHrChange: 0.0202,
                            twentyFourHourChange: 0.1539,
                            threeDayChange: 0.1969,
                            sevenDayChange: 0.2187,
                            oneMonthChange: 0.3069,
                            newsArticles: [Currency.NewsArticle(title: "Litecoin Surges After PayPal Includes It Among the Cryptos Customers Can Buy, Sell, Hold",
                                            url: "https://www.coindesk.com/litecoin-surges-after-paypal-includes-it-among-the-cryptos-its-customers-can-buy-sell-hold")])
        
        self.currencies.append(currency)
        
        currency = Currency(name: "USD Coin",
                            ticker: "USDC",
                            tradeVolume: 348926702,
                            price: 0.9998,
                            supply: 2832211251,
                            twelveHrChange: -0.0003,
                            twentyFourHourChange: -0.0002,
                            threeDayChange: -0.0005,
                            sevenDayChange: -0.0007,
                            oneMonthChange: -0.0069,
                            newsArticles: [Currency.NewsArticle(title: "USDC Is Coming to Solana Blockchain in Potential Boost for Non-Ethereum DeFi",
                                            url: "https://www.coindesk.com/usdc-is-coming-to-solana-blockchain-in-potential-boost-for-non-ethereum-defi")])
        
        self.currencies.append(currency)
        
        currency = Currency(name: "Neo",
                            ticker: "NEO",
                            tradeVolume: 372945904,
                            price: 15.83,
                            supply: 70538831,
                            twelveHrChange: 0.0084,
                            twentyFourHourChange: 0.0222,
                            threeDayChange: 0.0369,
                            sevenDayChange: 0.0443,
                            oneMonthChange: 0.0696,
                            newsArticles: [Currency.NewsArticle(title: "First Mover: Bitcoin Steady as Trump Tweets and Neo Takes on Ethereum",
                                            url: "https://www.coindesk.com/first-mover-bitcoin-steady-trump-tweets-neo-ethereum")])
        
        self.currencies.append(currency)
        
        currency = Currency(name: "Bitcoin Cash",
                            ticker: "BCH",
                            tradeVolume: 1597582949,
                            price: 255.12,
                            supply: 18574713,
                            twelveHrChange: 0.0030,
                            twentyFourHourChange: 0.0149,
                            threeDayChange: -0.0069,
                            sevenDayChange: -0.0109,
                            oneMonthChange: -0.0469,
                            newsArticles: [Currency.NewsArticle(title: "Bitcoin Cash Has Split Into Two New Blockchains, Again",
                                            url: "https://www.coindesk.com/bitcoin-cash-has-split-into-two-new-blockchains-again")])
        
        self.currencies.append(currency)
    }
    

}

struct Currency: Identifiable, Codable, Equatable {
    let id = UUID()
    var name: String
    let ticker: String
    var tradeVolume: Int
    var price: Double
    var supply: Int
    var twelveHrChange: Double
    var twentyFourHourChange: Double
    var threeDayChange: Double
    var sevenDayChange: Double
    var oneMonthChange: Double
    var newsArticles: [NewsArticle]
    
    var favorited = false
    
    var quantity: Int? = nil
    var buyPrice: Double? = nil
    
    struct NewsArticle: Identifiable, Codable, Equatable {
        let id = UUID()
        let title: String
        let url: String
    }
    
}
