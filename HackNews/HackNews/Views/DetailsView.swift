//
//  DetailsView.swift
//  HackNews
//
//  Created by Jun Guo on 2022-09-13.
//

import SwiftUI
import WebKit

struct DetailsView: View {
    let post: Post?
    var body: some View {
        VStack {
            WebView(urlString: post?.url)
        }.navigationTitle(post?.title ?? "")
    }
}

struct DetailsView_Previews: PreviewProvider {

    static var previews: some View {
        DetailsView(post: Post(objectID: "123", points: 12, title: "test title", url: "https://google.ca"))
    }
}


struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        let view = WKWebView()
        return view
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                
                uiView.load(request)
            }
            
        }
    }
}
