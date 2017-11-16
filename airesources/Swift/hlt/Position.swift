import Foundation

public protocol Position {
    var x: Double { get }
    var y: Double { get }
}

extension Position {
    public func at() -> Position {
        return Pos(x: x, y: y)
    }
    
    public func distance(to: Position) -> Double {
        return sqrt(pow(x - to.x, 2) + pow(y - to.y, 2))
    }
    
    public func orientInRadians(towards: Position) -> Double {
        return atan2(y - towards.y, x - towards.x) + 2 * M_PI
    }
    
    public func closestPoint(to: Entity) -> Position {
        let radius = to.radius + Double(Constants.MIN_DISTANCE_FOR_CLOSEST_POINT)
        let angleRads = to.orientInRadians(towards: self)
        return Pos(x: to.x + radius * cos(angleRads), y: to.y + radius * sin(angleRads))
    }
}

public struct Pos : Position, CustomStringConvertible {
    public let x: Double
    public let y: Double
    
    init(metadata: Metadata) {
        x = Double(metadata.pop())!
        y = Double(metadata.pop())!
    }
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    
    public var description: String {
        return "Position(x: \(x), y: \(y))"
    }
}
