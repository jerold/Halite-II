import Foundation


public enum Move: CustomStringConvertible {
    case Dock(Ship)
    case Thrust(Ship, magnitude: Double, radians: Double)
    case Undock(Ship)
    
    func to() -> Position {
        switch self {
        case let .Dock(ship):
            return Pos(x: ship.x, y: ship.y)
        case let .Thrust(ship, magnitude, radians):
            return Pos(x: ship.x + magnitude * cos(radians), y: ship.y + magnitude * sin(radians))
        case let .Undock(ship):
            return Pos(x: ship.x, y: ship.y)
        }
    }
    
    public var description: String {
        switch self {
        case let .Dock(ship):
            return "d \(ship.id)"
        case let .Thrust(ship, magnitude, radians):
            return "t \(ship.id) \(magnitude) \(radians)"
        case let .Undock(ship):
            return "u \(ship.id)"
        }
    }
}
