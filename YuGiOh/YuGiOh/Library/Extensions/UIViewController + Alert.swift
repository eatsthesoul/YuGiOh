//
//  UIViewController + Alert.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 12.04.22.
//

import UIKit


extension UIViewController {
    
    func presentDefaultAlert(title: String,
                             message: String,
                             buttonTitle: String?,
                             buttonAction: EmptyClosure?
    ) {
        
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        
        let action = UIAlertAction(title: buttonTitle, style: .default) { _ in
            alert.dismiss(animated: true, completion: buttonAction)
        }
        alert.addAction(action)
        
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
            alert.dismiss(animated: true, completion: nil)
        }
        alert.addAction(okAction)
        
        self.present(alert, animated: true, completion: nil)
    }
}
