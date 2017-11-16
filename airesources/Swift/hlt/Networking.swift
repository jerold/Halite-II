import Foundation

public struct Networking {
    var name: String
    var turn: Int
    
    init() {
        
    }
    
    public mutating func initialize(botName: String) -> GameMap {
        name = botName
        turn = 0
        return GameMap()
    }
    
    public func write() {
        
    }
    
    public func read() {
        
    }
}
