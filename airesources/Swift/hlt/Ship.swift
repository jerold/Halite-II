import Foundation


public struct Ship : Entity {
    public let x: Double
    public let y: Double
    
    public let owner: Int
    public let id: Int
    public let health: Int
    public let radius: Double
    
    public let dockingStatus: DockingStatus
    public let dockedPlanet: Int
    public let dockingProgress: Int
    public let weaponCooldown: Int
    
    public enum DockingStatus: Int {
        case Undocked, Docking, Docked, Undocking
    }
    
    init(metadata: Metadata) {
        let entity = EntityFields(metadata: metadata)
        x = entity.x
        y = entity.y
        owner = entity.owner
        id = entity.id
        health = entity.health
        radius = entity.radius
        
        dockingStatus = DockingStatus.init(rawValue: Int(metadata.pop())!)!
        dockedPlanet = Int(metadata.pop())!
        dockingProgress = Int(metadata.pop())!
        weaponCooldown = Int(metadata.pop())!
    }
}
