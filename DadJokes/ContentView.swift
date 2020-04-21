//
//  ContentView.swift
//  DadJokes
//
//  Created by Sree Sai Raghava Dandu on 18/04/20.
//  Copyright © 2020 Sree Sai Raghava. All rights reserved.
//

import SwiftUI
struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Joke.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Joke.setup, ascending: true)
    ]) var jokes: FetchedResults<Joke>
    @State private var showingAddJoke = false
    var body: some View {
        NavigationView{
            List{
                ForEach(jokes,id: \.setup){joke in
                    NavigationLink(destination: Text(joke.punchline)){
                        EmojiView(for: joke.rating)
                        Text(joke.setup)
                    }
                    
                }
            .onDelete(perform: removeJokes)
            }.navigationBarTitle("All Groan Up")
                .navigationBarItems(leading: EditButton(),trailing: Button("Add"){
                    self.showingAddJoke.toggle()
                })
                .sheet(isPresented: $showingAddJoke){
                    AddView().environment(\.managedObjectContext,self.moc)
            }
        }
    }
    func removeJokes(at offsets:IndexSet){
        for index in offsets{
            let joke = jokes[index]
            moc.delete(joke)
        }
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
