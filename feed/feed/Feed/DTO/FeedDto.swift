
import Foundation

class FeedDto: Codable {
    let response: ResponseDto

    init(response: ResponseDto) {
        self.response = response
    }
}
