//
//  SafariViewController.swift
//  Breweries
//
//  Created by  Vitaly Dergunov on 18.01.2020.
//  Copyright © 2020 VitaliiDerhunov. All rights reserved.
//

import UIKit
import WebKit
import SafariServices

class SafariViewController: SFSafariViewController {
    
    private var urlBankWebView: URL
    
    init(url URL: URL) {
        self.urlBankWebView = URL
        super.init(url: self.urlBankWebView, configuration: SafariViewController.safariConfiguration())
        delegate = self
    }
    
    static func safariConfiguration() -> Configuration {
        let safariConfiguration = SFSafariViewController.Configuration()
        safariConfiguration.barCollapsingEnabled = true
        safariConfiguration.entersReaderIfAvailable = true
        return safariConfiguration
    }
}

extension SafariViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
