//
//  WebView.swift
//  Hacker News
//
//  Created by Olena Stepaniuk on 17.10.2020.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeUrlString = urlString {
            if let url = URL(string: safeUrlString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
