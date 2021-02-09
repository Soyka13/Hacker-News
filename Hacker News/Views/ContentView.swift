//
//  ContentView.swift
//  Hacker News
//
//  Created by Olena Stepaniuk on 17.10.2020.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var netManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(netManager.posts) { post in
                NavigationLink(
                    destination: DetailView(url: post.url),
                    label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    })
            }
            .navigationBarTitle("Hacker News")
        }
        .onAppear(perform: {
            self.netManager.fetchData()
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
