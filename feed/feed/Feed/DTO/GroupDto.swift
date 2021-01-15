
import Foundation

class GroupDto: Codable {
    let id: Int
    let name, screenName: String?
    let isClosed: Int?
    let type: String?
    let photo50, photo100, photo200: String

    enum CodingKeys: String, CodingKey {
        case id, name
        case screenName = "screen_name"
        case isClosed = "is_closed"
        case type
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }

    init(id: Int, name: String?, screenName: String?, isClosed: Int?, type: String?, photo50: String, photo100: String, photo200: String) {
        self.id = id
        self.name = name
        self.screenName = screenName
        self.isClosed = isClosed
        self.type = type
        self.photo50 = photo50
        self.photo100 = photo100
        self.photo200 = photo200
    }
}
