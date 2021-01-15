
import Foundation

class CommentsDto: Codable {
    let count: Int?

    init(count: Int?) {
        self.count = count
    }
}
