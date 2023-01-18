// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct ProductsData: Codable {
    enum CodingKeys: String, CodingKey {
        case vpProductByIds
    }

    let vpProductByIds: [VpProductByIds]?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        vpProductByIds = try container.decodeIfPresent([VpProductByIds].self, forKey: .vpProductByIds)
    }
}
