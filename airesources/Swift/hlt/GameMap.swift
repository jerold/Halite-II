import Foundation


public struct GameMap {
    let width, height, playerId: Int
    let players: [Player]
    let planets: [Int: Planet]
    let ships: [Int: Ship]
    
    
    init(metadata: Metadata) {
        
    }
}
