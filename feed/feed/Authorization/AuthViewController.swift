
import UIKit
import Alamofire

class AuthViewController: UIViewController, AuthServiceDelegate {
    @IBAction func loginButtonClicked() {
        authService.auth()
    }
    
    private let authService: AuthService
    private let instantiateFeedViewController: () -> FeedViewController
    
    init?(coder: NSCoder, authService: AuthService, instantiateFeedViewController: @escaping () -> FeedViewController) {
        self.authService = authService
        self.instantiateFeedViewController = instantiateFeedViewController
        
        super.init(coder: coder)
        
        self.authService.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with an AuthService.")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func authServiceShouldShow(_ viewController: UIViewController) {
        if (self.presentedViewController != nil) {
            self.dismiss(animated: true, completion: {
                self.present(viewController, animated: true, completion: {
                })
            })
        } else {
            self.present(viewController, animated: true, completion: {
            })
        }
    }
    
    func authServiceSignIn() {        
        navigationController?.pushViewController(instantiateFeedViewController(), animated: true)
    }
    
    func authServiceDidSignInFail() {
        // ignored, show error
    }
}
