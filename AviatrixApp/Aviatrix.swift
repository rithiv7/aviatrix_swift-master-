//
//  Aviatrix.swift
//  AviatrixApp
//
//  Created by Amy Holt on 6/10/18.
//  Copyright © 2018 Amy Holt. All rights reserved.
//
import Foundation

class Aviatrix {
    
    
    var running = false
    var name = ""
    var data = AviatrixData()
    var distanceTraveled = 0
    let maxFuel = 5000
    var fuelLevel = 5000.0
    var milesPerGallon = 0.4
    var refuelAmount = 0.0
    var fuelCost = 0.0

    func start() -> Bool {
        running = true
        return running
    }
    
    func refuel() {
        refuelAmount = Double(maxFuel) - fuelLevel
        fuelLevel = Double(maxFuel)
        fuelCost += refuelAmount * plane.data.fuelPrices[plane.location]!
    }
    
    func flyTo(destination : String) {
        distanceTraveled += distanceTo(current: location, target: destination)
        location = destination
        
        fuelLevel -= Double(distanceTraveled) / milesPerGallon
    }
    
    
  
    var location = "St. Louis"
    func distanceTo(current: String, target: String) -> Int {
        return data.knownDistances[current]![target]!
    }
    
    func knownDestinations() -> [String] {
        return ["St. Louis", "Phoenix", "Denver", "SLC"]
    }
    init(authorName : String) {
        name = authorName
    }
    
}
