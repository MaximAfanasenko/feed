
import Foundation
import Alamofire

class FeedService {
    private let newsFeedGetRequestUrl = "https://api.vk.com/method/newsfeed.get"
    
    private let filtersHeader = "filters"
    private let filtersValue = "post"
    
    private let countHeader = "count"
    private let countValue = "10"
    
    private let vkApiVersionHeader = "v"
    private let vkApiVersionValue = "5.126"
    
    private let accessTokenHeader: String = "access_token"
    private let startFromHeader: String = "start_from"
    
    var nextFrom: String? = nil
    
    public func getFeed(accessToken: String, completion: @escaping ([FeedItem])->Void) {
        
        let parameters: [String : String]
        
        if (nextFrom == nil) {
            parameters = [filtersHeader : filtersValue, countHeader : countValue, vkApiVersionHeader : vkApiVersionValue, accessTokenHeader : accessToken]
        } else {
            parameters = [filtersHeader : filtersValue, countHeader : countValue, vkApiVersionHeader : vkApiVersionValue, accessTokenHeader : accessToken,  startFromHeader : nextFrom!]
        }
        
        AF.request(newsFeedGetRequestUrl, method: .get, parameters: parameters).responseDecodable {(response: AFDataResponse<FeedDto>) in
            if (response.value != nil) {
                self.nextFrom = response.value?.response.nextFrom ?? nil
                let feedItems = FeedMapper.toModel(response.value!)
                completion(feedItems)
            }
        }
    }
}
