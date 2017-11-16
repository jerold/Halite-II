import Foundation


public struct Planet : Entity {
    public let x: Double
    public let y: Double
    
    public let owner: Int
    public let id: Int
    public let health: Int
    public let radius: Double
    
    public let remainingProduction: Int
    public let currentProduction: Int
    public let dockingSpots: Int
    public let dockedShips: [Int]
    
    init(metadata: Metadata) {
        let entity = EntityFields(metadata: metadata)
        x = entity.x
        y = entity.y
        owner = entity.owner
        id = entity.id
        health = entity.health
        radius = entity.radius
        
        remainingProduction = Int(metadata.pop())!
        currentProduction = Int(metadata.pop())!
        dockingSpots = Int(metadata.pop())!
        let dockedShipsCount = Int(metadata.pop())!
        var ships: [Int] = []
        for _ in 1...dockedShipsCount {
            ships.append(Int(metadata.pop())!)
        }
        dockedShips = ships
    }
}

