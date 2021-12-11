//
//  GameListItem.swift
//  UsedGames
//
//  Created by Berat Yavuz on 8.11.2021.
//

//gameListItem ayrı bir component gibi burada yazıldı

import SwiftUI
struct GameListItem: View {
    var game:Game
    var numberFormatter:NumberFormatter=Formatters.dollarFormatter
    
    var body: some View {
        HStack {
            VStack(alignment: .leading,  spacing: 4.0) {
                
                Text(game.name)
                    .font(.body)
                Text(game.serialNumber)
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
            Spacer()
            Text(NSNumber(value: game.priceInDollars), formatter:
                    numberFormatter)
                .font(.title2)
                .foregroundColor(game.priceInDollars > 30 ? .blue : .gray)
        }
        .padding(.vertical,6 )
    }
}
struct GameListItem_Previews: PreviewProvider{
    static var previews: some View{
        Group {
            //aynı anda hem normal halini hem de dark halini preview edebiliyoruz daha da fazla özellik ekleyerek preview etmeye devam edebiliriz
            GameListItem(game: Game(random:true)).padding(.horizontal)
                .previewLayout(.sizeThatFits)
            
            GameListItem(game: Game(random:true)).padding(.horizontal)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
            
        

        }
    }
}
