//
//  WorldCupManager.swift
//  FIFAWorldCupChampions
//
//  Created by Luan Arruda on 26/10/23.
//

import Foundation

class WorldCupManager {

    static let shared = WorldCupManager()
    
    var worldCups: [WorldCup] = []
    
    private init() {
        if let jsonURL = Bundle.main.url(forResource: "winners", withExtension: "json") {
            do {
                let jsonData = try Data(contentsOf: jsonURL)
                let jsonDecoder = JSONDecoder()
                worldCups = try jsonDecoder.decode([WorldCup].self, from: jsonData)
            }
            catch {
                print("Erro ao carregar o arquivo JSON: \(error.localizedDescription)")
            }
        } else {
            print("Arquivo JSON não encontrado")
        }
    }
}
