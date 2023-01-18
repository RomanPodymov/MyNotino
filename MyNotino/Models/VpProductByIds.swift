// Generated using SwiftyJSONAccelerator — https://github.com/insanoid/SwiftyJSONAccelerator

import Foundation

struct VpProductByIds: Codable {
    enum CodingKeys: String, CodingKey {
        case masterId // swiftlint:disable:this inclusive_language
        case productCode
        case stockAvailability
        case imageUrl
        case name
        case url
        case reviewSummary
        case annotation
        case price
        case productId
        case attributes
        case orderUnit
        case brand
    }

    let masterId: Int? // swiftlint:disable:this inclusive_language
    let productCode: String?
    let stockAvailability: StockAvailability?
    let imageUrl: String?
    let name: String?
    let url: String?
    let reviewSummary: ReviewSummary?
    let annotation: String?
    let price: Price?
    let productId: Int?
    let attributes: Attributes?
    let orderUnit: String?
    let brand: Brand?

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        masterId = try container.decodeIfPresent(Int.self, forKey: .masterId)
        productCode = try container.decodeIfPresent(String.self, forKey: .productCode)
        stockAvailability = try container.decodeIfPresent(StockAvailability.self, forKey: .stockAvailability)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl)
        name = try container.decodeIfPresent(String.self, forKey: .name)
        url = try container.decodeIfPresent(String.self, forKey: .url)
        reviewSummary = try container.decodeIfPresent(ReviewSummary.self, forKey: .reviewSummary)
        annotation = try container.decodeIfPresent(String.self, forKey: .annotation)
        price = try container.decodeIfPresent(Price.self, forKey: .price)
        productId = try container.decodeIfPresent(Int.self, forKey: .productId)
        attributes = try container.decodeIfPresent(Attributes.self, forKey: .attributes)
        orderUnit = try container.decodeIfPresent(String.self, forKey: .orderUnit)
        brand = try container.decodeIfPresent(Brand.self, forKey: .brand)
    }
}
