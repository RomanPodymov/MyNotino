// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct Attributes: Codable {
    enum CodingKeys: String, CodingKey {
        case airTransportDisallowed = "AirTransportDisallowed"
        case action = "Action"
        case differentPackaging = "DifferentPackaging"
        case master = "Master" // swiftlint:disable:this inclusive_language
        case new = "New"
        case freeDelivery = "FreeDelivery"
        case packageSize = "PackageSize"
    }

    let airTransportDisallowed: Bool?
    let action: Bool?
    let differentPackaging: Bool?
    let master: Bool? // swiftlint:disable:this inclusive_language
    let new: Bool?
    let freeDelivery: Bool?
    let packageSize: PackageSize?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        airTransportDisallowed = try container.decodeIfPresent(Bool.self, forKey: .airTransportDisallowed)
        action = try container.decodeIfPresent(Bool.self, forKey: .action)
        differentPackaging = try container.decodeIfPresent(Bool.self, forKey: .differentPackaging)
        master = try container.decodeIfPresent(Bool.self, forKey: .master)
        new = try container.decodeIfPresent(Bool.self, forKey: .new)
        freeDelivery = try container.decodeIfPresent(Bool.self, forKey: .freeDelivery)
        packageSize = try container.decodeIfPresent(PackageSize.self, forKey: .packageSize)
    }
}
