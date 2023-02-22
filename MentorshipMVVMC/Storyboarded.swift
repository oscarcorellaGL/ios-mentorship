//
//  Storyboarded.swift
//  MentorshipMVVMC
//
//  Created by Oscar Corella on 16/2/23.
//

import Foundation
import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        
        guard let name = description().components(separatedBy: ".").last?.replacingOccurrences(of: "ViewController", with: "")
        else {
            return Self.init(nibName: nil, bundle: nil)
        }
        let storyboard = UIStoryboard(name: name, bundle: Bundle.main)
        return storyboard.instantiateInitialViewController() as! Self
        
//            // this pulls out "MyApp.MyViewController"
//            let fullName = NSStringFromClass(self)
//            // this splits by the dot and uses everything after, giving "MyViewController"
//            let className = fullName.components(separatedBy: ".")[1]
//            // load our storyboard
//            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main) // sacar name a parametro
//            // instantiate a view controller with that identifier, and force cast as the type that was requested
//            return storyboard.instantiateViewController(withIdentifier: className) as! Self
        }
    
}
