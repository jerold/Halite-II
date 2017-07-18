//
// Created by David Li on 7/17/17.
//

#include "Entity.hpp"

namespace hlt {
    auto Location::distance(const Location &other) const -> double {
        return sqrt(distance2(other));
    }

    auto Location::distance2(const Location &other) const -> double {
        return std::pow(other.pos_x - pos_x, 2) +
            std::pow(other.pos_y - pos_y, 2);
    }

    auto operator<<(std::ostream &ostream,
                    const Location &location) -> std::ostream & {
        ostream << '(' << location.pos_x << ", " << location.pos_y << ')';
        return ostream;
    }

    auto Velocity::accelerate_by(double magnitude,
                                 double angle) -> void {
        double new_vel_x = vel_x + magnitude * std::cos(angle);
        double new_vel_y = vel_y + magnitude * std::sin(angle);

        vel_x = new_vel_x;
        vel_y = new_vel_y;

        const auto max_speed = GameConstants::get().MAX_SPEED;
        if (this->magnitude() > max_speed) {
            double scale = max_speed / this->magnitude();
            new_vel_x *= scale;
            new_vel_y *= scale;
        }
        vel_x = new_vel_x;
        vel_y = new_vel_y;
    }

    auto Velocity::magnitude() const -> double {
        return sqrt(vel_x * vel_x + vel_y * vel_y);
    }

    auto Velocity::angle() const -> double {
        return atan2(vel_y, vel_x);
    }

    EntityId::EntityId() {
        type = EntityType::InvalidEntity;
        _player_id = -1;
        _entity_index = -1;
    }

    auto EntityId::is_valid() const -> bool {
        return type != EntityType::InvalidEntity &&
            _player_id >= -1 && _entity_index >= 0;
    }

    auto EntityId::invalid() -> EntityId {
        return EntityId();
    }

    auto EntityId::player_id() const -> PlayerId {
        return static_cast<PlayerId>(_player_id);
    }

    auto EntityId::entity_index() const -> EntityIndex {
        return static_cast<EntityIndex>(_entity_index);
    }

    auto EntityId::for_planet(EntityIndex index) -> EntityId {
        auto result = EntityId();
        result.type = EntityType::PlanetEntity;
        result._entity_index = static_cast<int>(index);
        return result;
    }

    auto EntityId::for_ship(PlayerId player_id, EntityIndex index) -> EntityId {
        auto result = EntityId();
        result.type = EntityType::ShipEntity;
        result._player_id = player_id;
        result._entity_index = static_cast<int>(index);
        return result;
    }

    auto operator<<(std::ostream &ostream,
                    const EntityId &id) -> std::ostream & {
        switch (id.type) {
            case EntityType::InvalidEntity:ostream << "[Invalid ID]";
                break;
            case EntityType::PlanetEntity:
                ostream << "[Planet " << id.entity_index() << "]";
                break;
            case EntityType::ShipEntity:
                ostream << "[Ship " << static_cast<int>(id.player_id());
                ostream << ' ' << id.entity_index() << "]";
                break;
        }

        return ostream;
    }

    auto operator==(const EntityId &id1, const EntityId &id2) -> bool {
        return id1._player_id == id2._player_id
            && id1._entity_index == id2._entity_index;
    }

    auto operator!=(const EntityId &id1, const EntityId &id2) -> bool {
        return !(id1 == id2);
    }

    auto Planet::add_ship(EntityIndex ship) -> void {
        assert(docked_ships.size() < docking_spots);
        docked_ships.push_back(ship);
    }

    auto Planet::remove_ship(EntityIndex ship_id) -> void {
        auto pos = std::find(
            docked_ships.begin(),
            docked_ships.end(),
            ship_id
        );
        if (pos != docked_ships.end()) {
            docked_ships.erase(pos);
        }

        if (docked_ships.size() == 0) {
            owned = false;
            owner = 0;
        }
    }

    auto to_json(nlohmann::json& json, const hlt::Location& location) -> void {
        json["x"] = location.pos_x;
        json["y"] = location.pos_y;
    }

    auto to_json(nlohmann::json& json, const hlt::EntityId& id) -> void {
        switch (id.type) {
            case hlt::EntityType::ShipEntity: {
                json["type"] = "ship";
                json["owner"] = id.player_id();
                json["id"] = id.entity_index();
                break;
            }
            case hlt::EntityType::InvalidEntity:
                json["type"] = "invalid";
                break;
            case hlt::EntityType::PlanetEntity: {
                json["type"] = "planet";
                json["id"] = id.entity_index();
                break;
            }
        }
    }
}