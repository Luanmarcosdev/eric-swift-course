//
//  StudyManager.swift
//  PlanoDeEstudos
//
//  Created by Luan Arruda on 21/02/24.
//  Copyright © 2024 Eric Brito. All rights reserved.
//

import Foundation

class StudyManager {
    
    static let shared = StudyManager()
    var studyPlans: [StudyPlan] = []
    let userDefaults = UserDefaults.standard
    
    private init(){
        if let data = userDefaults.data(forKey: "studyPlans"), let plans = try? JSONDecoder().decode([StudyPlan].self, from: data) {
            self.studyPlans = plans
        }
    }
    
    func savePlans(){
        if let data = try? JSONEncoder().encode(studyPlans){
            userDefaults.set(data, forKey: "studyPlans")
        }
    }
    
    func addPlan(_ studyPlan: StudyPlan){
        studyPlans.append(studyPlan)
        savePlans()
    }
    
    func removePlan(at index: Int){
        studyPlans.remove(at: index)
        savePlans()
    }
}
