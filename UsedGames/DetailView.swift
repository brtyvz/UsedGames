//
//  DetailView.swift
//  UsedGames
//
//  Created by Berat Yavuz on 9.11.2021.
//

import SwiftUI
import Combine

struct DetailView: View {
    var game:Game
    var gameStore:GameStore
    @State var name:String=""
    @State var price:Double=0.0
    @State var shouldEnableSaveButton: Bool=true
    func validate(){
        //!= eşit değildir
        shouldEnableSaveButton = game.name != name || game.priceInDollars != price
    }
    var body: some View {
        Form{
            
            Section{
                VStack(alignment: .leading){
                    Text("Name").foregroundColor(.secondary)
                    TextField("Name", text: $name).textFieldStyle(RoundedBorderTextFieldStyle())
                }
                VStack(alignment: .leading){
                    Text("PriceInDollars").foregroundColor(.secondary)
                    TextField("Price", value: $price, formatter: Formatters.dollarFormatter).keyboardType(.decimalPad)
                        
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                        //just--->name her değiştiğinde
                        .onReceive(Just(name), perform: { _ in
                            validate()
                        })
                }
                
            }
            Section{
                Button(action: {
                    let newGame = Game(name: name, priceInDollars: price, serialNumber: game.serialNumber)
                    gameStore.update(game: game, newValue: newGame )
                    
                }, label: {
                    Text("Save")
                        .frame(maxWidth:.infinity)
                        .frame(height:50.0)
                })
                .disabled(!shouldEnableSaveButton)
            }

        }.navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        let gameStore = GameStore()
        let game = gameStore.createGame()
        DetailView(game: game, gameStore: gameStore  )
    }
}
