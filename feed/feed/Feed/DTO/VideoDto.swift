
import Foundation

class VideoDto: Codable {
    let id: Int
    let image: ImageDto
    let player: String
    
    init(id: Int, image: ImageDto, player: String) {
        self.id = id
        self.image = image
        self.player = player
    }
}
