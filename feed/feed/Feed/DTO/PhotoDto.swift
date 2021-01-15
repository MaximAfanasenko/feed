
import Foundation

class PhotoDto: Codable {
    let id: Int
    let sizes: [SizeDto]    
    
    init(id: Int, sizes: [SizeDto]) {
        self.id = id
        self.sizes = sizes
    }
}
