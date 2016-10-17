//
//  ControlCenter.swift
//  Pirate Fleet
//
//  Created by Jarrod Parkes on 9/2/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

struct GridLocation {
    let x: Int
    let y: Int
}

struct Ship {
    let length: Int
    let location: GridLocation
    let isVertical: Bool
}

struct Mine: _Mine_ {
    let location: GridLocation
    let explosionText: String
}

class ControlCenter {
    
    func addShipsAndMines(_ human: Human) {
        let shipSa = Ship(length: 2, location: GridLocation(x:0,y:0), isVertical: false)
        let shipMa = Ship(length: 3, location: GridLocation(x:0,y:1), isVertical: false)
        let shipMb = Ship(length: 3, location: GridLocation(x:0,y:2), isVertical: false)
        let shipBa = Ship(length: 4, location: GridLocation(x:0,y:3), isVertical: false)
        let shipSBa = Ship(length: 5, location: GridLocation(x:0,y:4), isVertical: false)

        human.addShipToGrid(shipSa)
        human.addShipToGrid(shipMa)
        human.addShipToGrid(shipMb)
        human.addShipToGrid(shipBa)
        human.addShipToGrid(shipSBa)
        
        let mineA = Mine(location: GridLocation(x:3,y:0), explosionText: "mine a explosion")
        let mineB = Mine(location: GridLocation(x:4,y:0), explosionText: "mine b explosion")
        human.addMineToGrid(mineA)
        human.addMineToGrid(mineB)
    }
    
    func calculateFinalScore(_ gameStats: GameStats) -> Int {
        
        var finalScore: Int
        
        finalScore = (gameStats.numberOfHitsOnEnemy * gameStats.sinkBonus) + ((5-gameStats.humanShipsSunk) * gameStats.shipBonus) - ((gameStats.numberOfMissesByHuman/5 - gameStats.numberOfHitsOnEnemy/5) * gameStats.guessPenalty)
        
        print("the value of final score is \(finalScore)")
        
        return finalScore
    }
}
