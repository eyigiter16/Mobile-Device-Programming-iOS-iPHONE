//
//  GuessHelper.swift
//  guessingGame
//
//  Created by Ekrem Yiğiter on 17.10.2021.
//

import Foundation

class GuessingHelper {
    var pick: Int = 0
    var tries: Int = 0
    
    var delegate : GuessingGameProtocol?
    
    init () {}
    
    func getRandPick() {
        pick = Int.random(in: 1...10)
    }
    
    func increaseTries() {
        tries += 1
        self.delegate?.triesRemains()
    }
    
    func resetTries() {
        tries = 0
    }
}
