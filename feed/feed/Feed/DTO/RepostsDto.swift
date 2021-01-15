
import Foundation

class RepostsDto: Codable {
    let count: Int?

    init(count: Int?) {
        self.count = count
    }
}
