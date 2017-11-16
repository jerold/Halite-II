import Foundation


public protocol Entity : Position {
    var owner: Int { get }
    var id: Int { get }
    var health: Int { get }
    var radius: Double { get }
}

//public struct Ent : Entity, CustomStringConvertible {
//    public let x: Double
//    public let y: Double
//    
//    public let owner: Int
//    public let id: Int
//    public let health: Int
//    public let radius: Double
//    
//    init(metadata: Metadata) {
//        let position = Pos(metadata: metadata)
//        x = position.x
//        y = position.y
//        
//        owner = Int(metadata.pop())!
//        id = Int(metadata.pop())!
//        health = Int(metadata.pop())!
//        radius = Double(metadata.pop())!
//    }
//    
//    public var description: String {
//        return "Entity(id: \(id), owner: \(owner), health: \(health), radius: \(radius), x: \(x), y: \(y))"
//    }
//}
//
