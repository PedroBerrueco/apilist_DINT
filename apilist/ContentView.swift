//
//  ContentView.swift
//  apilist
//
//  Created by pedro on 15/2/24.
//

import SwiftUI

struct ContentView: View {
    @State var posts: [Post] = []
    
    var body: some View {
            List(posts){ post in
                HStack{
                    VStack{
                        Text(post.title).bold().lineLimit(1).font(.title3)
                        Text(post.body).lineLimit(1).font(.footnote)
                    }
                    Spacer()
                    Text("Post #: \(post.id)")
                }
                
            }
            .navigationTitle("Post from API")
            .onAppear{
                fetchData()
            }
    }
    
    private func fetchData(){
        //Parse URL
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                do{
                    //Parse Json
                    let decodeData = try
                    JSONDecoder().decode([Post].self, from: data)
                    self.posts = decodeData
                } catch {
                    //Print JSON decoding error
                    print("Error decoding JSON; \(error.localizedDescription)")
                }
            } else if let error = error {
                //Print API Call error
                print("Error fetching data: \(error.localizedDescription)")
            }
            
        }.resume()
        
    }
}





