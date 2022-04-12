//
//  UIViewController.swift
//  YuGiOh
//
//  Created by Evgeniy Petlitskiy on 12.04.22.
//

import UIKit
import ProgressHUD

extension UIViewController {
    
    func startLoading() {
        ProgressHUD.show()
        self.view.isUserInteractionEnabled = false
        self.navigationController?.navigationBar.isUserInteractionEnabled = false
    }
    
    func stopLoading() {
        ProgressHUD.dismiss()
        self.view.isUserInteractionEnabled = true
        self.navigationController?.navigationBar.isUserInteractionEnabled = true
    }
}
