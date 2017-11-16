import Foundation


public struct Constants {
    
    ////////////////////////////////////////////////////////////////////////
    // Implementation-independent language-agnostic constants
    
    /** Games will not have more players than this */
    public static let MAX_PLAYERS: Int = 4
    
    /** Max number of units of distance a ship can travel in a turn */
    public static let MAX_SPEED: Int = 7
    
    /** Radius of a ship */
    public static let SHIP_RADIUS: Double = 0.5
    
    /** Starting health of ship, also its max */
    public static let MAX_SHIP_HEALTH: Int = 255
    
    /** Starting health of ship, also its max */
    public static let BASE_SHIP_HEALTH: Int = 255
    
    /** Weapon cooldown period */
    public static let WEAPON_COOLDOWN: Int = 1
    
    /** Weapon damage radius */
    public static let WEAPON_RADIUS: Double = 5.0
    
    /** Weapon damage */
    public static let WEAPON_DAMAGE: Int = 64
    
    /** Radius in which explosions affect other entities */
    public static let EXPLOSION_RADIUS: Double = 10.0
    
    /** Distance from the edge of the planet at which ships can try to dock */
    public static let DOCK_RADIUS: Double = 4.0
    
    /** Number of turns it takes to dock a ship */
    public static let DOCK_TURNS: Int = 5
    
    /** Number of turns it takes to create a ship per docked ship */
    public static let BASE_PRODUCTIVITY: Int = 6
    
    /** Distance from the planets edge at which new ships are created */
    public static let SPAWN_RADIUS: Double = 2.0
    
    ////////////////////////////////////////////////////////////////////////
    // Implementation-specific constants
    
    public static let FORECAST_FUDGE_FACTOR: Double = 0.6 // SHIP_RADIUS + 0.1;
    public static let MAX_NAVIGATION_CORRECTIONS: Int = 90;
    
    /**
     * Used in Position.getClosestPoint()
     * Minimum distance specified from the object's outer radius.
     */
    public static let MIN_DISTANCE_FOR_CLOSEST_POINT: Int = 3;
}
