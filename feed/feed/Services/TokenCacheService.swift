
import Foundation

class TokenCacheService {
    private let tokenCacheKey = "CACHE_KEY_ACCESS_TOKEN"
    
    public func getToken() -> String? {
        return UserDefaults.standard.string(forKey: tokenCacheKey)
    }
    
    public func setToken(accessToken: String) {
        UserDefaults.standard.set(accessToken, forKey: self.tokenCacheKey)
    }
}
