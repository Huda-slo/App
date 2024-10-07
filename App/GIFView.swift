

import SwiftUI
import WebKit

struct GIFView: UIViewRepresentable {
    let gifName: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        // Get the path to the gif file
        if let path = Bundle.main.path(forResource: gifName, ofType: "gif") {
            let gifData = try! Data(contentsOf: URL(fileURLWithPath: path))
            webView.load(gifData, mimeType: "image/gif", characterEncodingName: "UTF-8", baseURL: URL(fileURLWithPath: path))
        }

        webView.scrollView.isScrollEnabled = false
        webView.backgroundColor = .clear
        webView.isOpaque = false
        webView.contentMode = .scaleAspectFit
        
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // Nothing to update here for static GIFs
    }
}
//
//  GIFView.swift
//  App
//
//  Created by Arafat on 04/04/1446 AH.
//

