// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct Price: Codable {
    enum CodingKeys: String, CodingKey {
        case value
        case currency
    }

    let value: Double?
    let currency: String?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decodeIfPresent(Double.self, forKey: .value)
        currency = try container.decodeIfPresent(String.self, forKey: .currency)
    }
}
