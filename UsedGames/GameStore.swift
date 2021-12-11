//
//  GameStore.swift
//  UsedGames
//
//  Created by Berat Yavuz on 25.10.2021.
//

import Foundation
class GameStore:ObservableObject {
   @Published var games:[Game] = []
        
        
    
    init() {}
    
    @discardableResult func createGame() -> Game {
        let game = Game(random: true)
        games.append(game)
        return game
    }
    
    func delete(at indexSet: IndexSet){
        
        games.remove(atOffsets: indexSet)
    }
    func move(indices:IndexSet,to NewOffset:Int){
        games.move(fromOffsets: indices, toOffset: NewOffset)
    }
    func game(at indexSet: IndexSet)->Game?{
        if let firstIndex = indexSet.first{
            return games[firstIndex]
            
        }
        return nil
        
    }
    func indexSet(for game: Game)->IndexSet?{
        if let firstIndex = games.firstIndex(of: game){
            return IndexSet(integer: firstIndex)
            
        }
        else {return nil}
        }
    func update(game:Game,newValue:Game){
        if let index = games.firstIndex(of: game){
            games[index]=newValue
        }
    }
}
