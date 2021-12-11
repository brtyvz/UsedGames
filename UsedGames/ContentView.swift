//
//  ContentView.swift
//  UsedGames
//
//  Created by Berat Yavuz on 24.10.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gameStore=GameStore()
    //opsiyonel işi bitince nil olucak
    @State var gameToDelete: Game?
    var body: some View {
        NavigationView{
            List{
                ForEach(gameStore.games) {
                    (game) in
                    NavigationLink(
                        destination: DetailView(game: game,
                                                gameStore: gameStore,
                                                name: game.name,
                                                price: game.priceInDollars)
                        ){  GameListItem(game: game)}
                  }
                    .onDelete(perform: { indexSet in
                    self.gameToDelete = gameStore.game(at: indexSet)
                })
                .onMove(perform: { indices, newOffset in
                            gameStore.move(indices: indices, to: newOffset)
                }) }.listStyle(PlainListStyle())
                .navigationTitle("Used Games")
            .navigationBarItems(leading: EditButton(), trailing:  Button(action: {gameStore.createGame()}, label: {
                    Text("Add")
                }))
                .animation(/*@START_MENU_TOKEN@*/.easeIn/*@END_MENU_TOKEN@*/)
                .actionSheet(item: $gameToDelete){
                (game)->ActionSheet in
                ActionSheet(title: Text("Warning"), message: Text(" delete\(game.name)?"),
                            buttons:[
                    .cancel(),
                    .destructive(Text("delete"), action: {
                    if let indexSet = gameStore.indexSet(for: game){
                        gameStore.delete(at: indexSet)
                    }
                })
                    
                ])
                }
            
        }
        }
     
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


