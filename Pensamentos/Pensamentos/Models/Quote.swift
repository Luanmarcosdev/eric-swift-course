//
//  Quote.swift
//  Pensamentos
//
//  Created by Luan Arruda on 24/10/23.
//

import Foundation

struct Quote: Codable { //Encondable, Decodable
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return "〝" + quote + "〞"
    }
    
    var authorFormatted: String {
        return "- " + author + " -"
    }
}
