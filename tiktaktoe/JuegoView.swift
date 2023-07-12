//
//  ContentView.swift
//  tiktaktoe
//
//  Created by Ricardo Paredes on 7/10/23.
//

import SwiftUI

struct JuegoView: View {
    @EnvironmentObject var game : GameService
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var oponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    

    var body: some View {
        //        navigation
                NavigationStack{
        
        //        body
                    VStack(alignment: .center) {
            Picker("Select Game", selection: $gameType ) {
                Text("select Game Type").tag(GameType.undetermined)
                Text("two dahring devices").tag(GameType.single)
                Text("challenge cou").tag(GameType.bot)
                
                Text("Challenge online").tag(GameType.peer)
                
            }.padding().background(RoundedRectangle(cornerRadius: 10, style: .continuous ).stroke(lineWidth: 2))
            
            Text(gameType.description).padding(
            )
            
            //            hame type ?? whast this wxactly
            VStack{
                switch gameType {
                case .single:
                    VStack{
                        TextField("Your Name", text: $yourName)
                        TextField("Opponent Name", text: $oponentName)
                    }
                case .bot:
                    TextField("Your Name", text: $yourName)
                case .peer:
                    EmptyView()
                    
                case .undetermined:
                    EmptyView()
                }
            }.padding().textFieldStyle(.roundedBorder).focused($focus)
                .frame(width: 350)
            
            if gameType != .peer {
                Button("Start Game"){
                    game.setupGame(gameType: gameType, player1Name: yourName, player2Name: oponentName)
                    focus = false
                    startGame.toggle()
                }.buttonStyle(.borderedProminent).disabled(
                    gameType == .undetermined ||
                    gameType == .bot && yourName.isEmpty ||
                    gameType == .single && (yourName.isEmpty || oponentName.isEmpty)
                )
                Image("LaunchScreen")
            }
            Spacer()
        }
                .padding().navigationTitle("tikotoko")
                .fullScreenCover(isPresented: $startGame, content: { GamePantalla()
                    
                }
                )
                }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        JuegoView().environmentObject(GameService())
    }
}
