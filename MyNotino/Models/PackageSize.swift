// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct PackageSize: Codable {
    enum CodingKeys: String, CodingKey {
        case height
        case width
        case depth
    }

    let height: Int?
    let width: Int?
    let depth: Int?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        height = try container.decodeIfPresent(Int.self, forKey: .height)
        width = try container.decodeIfPresent(Int.self, forKey: .width)
        depth = try container.decodeIfPresent(Int.self, forKey: .depth)
    }
}
