
import Foundation

class ImageDto: Codable {
    let url: String
    
    init(url: String) {
        self.url = url
    }
}
