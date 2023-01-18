// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct ReviewSummary: Codable {
    enum CodingKeys: String, CodingKey {
        case score
        case averageRating
    }

    let score: Int?
    let averageRating: Double?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        score = try container.decodeIfPresent(Int.self, forKey: .score)
        averageRating = try container.decodeIfPresent(Double.self, forKey: .averageRating)
    }
}
