
import Foundation

class ResponseDto: Codable {
    let items: [ItemDto]
    let groups: [GroupDto]
    let nextFrom: String

    enum CodingKeys: String, CodingKey {
        case items, groups
        case nextFrom = "next_from"
    }

    init(items: [ItemDto], groups: [GroupDto], nextFrom: String) {
        self.items = items
        self.groups = groups
        self.nextFrom = nextFrom
    }
}
