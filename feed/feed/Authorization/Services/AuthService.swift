
import Foundation
import VKSdkFramework
import Alamofire

class AuthService: NSObject, VKSdkDelegate, VKSdkUIDelegate {
    
    private let vkSdk: VKSdk
    private let vkAppId = "7722098"
    private let scope = ["wall", "friends"]
    private let tokenCacheKey = "access_token"
    
    private let tokenCacheService: TokenCacheService
    
    weak var delegate: AuthServiceDelegate?
    
    init(tokenCacheService: TokenCacheService) {
        self.tokenCacheService = tokenCacheService
        vkSdk = VKSdk.initialize(withAppId: vkAppId)
        super.init()
        vkSdk.register(self)
        vkSdk.uiDelegate = self
    }
    
    func auth() {
        VKSdk.wakeUpSession(scope) { (state, error) in
            switch state {
            case .initialized:
                VKSdk.authorize(self.scope)
            case .authorized:
                self.delegate?.authServiceSignIn()
            default:
                self.delegate?.authServiceDidSignInFail()
                fatalError(error!.localizedDescription)
            }}
    }
    
    func vkSdkAccessAuthorizationFinished(with result: VKAuthorizationResult!) {
        if (result.token != nil) {
            tokenCacheService.setToken(accessToken: result.token.accessToken)
            self.delegate?.authServiceSignIn()
        } else {
            print(result.error.localizedDescription)
        }
    }
    
    func vkSdkUserAuthorizationFailed() {
        // ignored, show error
    }
    
    func vkSdkShouldPresent(_ controller: UIViewController!) {
        delegate?.authServiceShouldShow(controller)
    }
    
    func vkSdkNeedCaptchaEnter(_ captchaError: VKError!) {
        // ignored
    }    
}
