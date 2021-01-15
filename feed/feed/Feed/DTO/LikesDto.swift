
import Foundation

class LikesDto: Codable {
    let count: Int?

    init(count: Int?) {
        self.count = count
    }
}
