//
//  ContentView.swift
//  H4X0R News
//
//  Created by EDWAR FERNANDO MARTINEZ CASTRO on 5/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    var body: some View {
        NavigationView{
            List(networkManager.posts){ post in
                NavigationLink(
                    destination: DetailView(url: post.url)){
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("H4X0R NEWS")
        }
        .onAppear{
            self.networkManager.fetchData()            
        }
    }
}

//struct Post: Identifiable{
//    var id: String
//    let title: String
//}

//let posts = [
//    Post(id: "1"	, title: "Hello"),
//    Post(id: "2", title: "Bonjour"),
//    Post(id: "3", title: "Hola")]
//
//
//var a = Post(id: "4", title: "7")


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
