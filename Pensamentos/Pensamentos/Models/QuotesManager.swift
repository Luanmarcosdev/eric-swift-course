//
//  QuotesManager.swift
//  Pensamentos
//
//  Created by Luan Arruda on 24/10/23.
//

import Foundation

class QuotesManager {
    
    let quotes: [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
    }
}
