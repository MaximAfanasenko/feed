//
//  AuthServiceDelegate.swift
//  feed
//
//  Created by admin on 15.01.2021.
//

import Foundation
import UIKit

protocol AuthServiceDelegate: class {
    func authServiceShouldShow(_ viewController: UIViewController)
    func authServiceSignIn()
    func authServiceDidSignInFail()
}
