import SwiftUI

struct GamePantalla: View {
    
    @EnvironmentObject var game : GameService
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView{
            VStack   {
                if [game.player1.isCurrent, game.player2.isCurrent].allSatisfy({$0 == false}) {
                    Text("Select a Player to Start! ")
                }
                
                HStack {
                    
                    Button(game.player1.name){
                        game.player1.isCurrent = true
                    }
                    .buttonStyle(PlayerButtonStyle(isCurrent: game.player1.isCurrent))
                    
                    
                    Button(game.player2.name){
                        game.player2.isCurrent = true
                    }
                    .buttonStyle(PlayerButtonStyle(isCurrent: game.player2.isCurrent))

                    
                    
                }.disabled(game.gameStarted)
                
                VStack{
                    HStack {
                        ForEach(0...2, id: \.self) {
                            index in SquareView(index: index)
                        }
                        
                    }
                    
                    HStack {
                        ForEach(3...5, id: \.self) {
                            index in SquareView(index: index)
                        }
                        
                    }
                    
                    HStack {
                        ForEach(6...8, id: \.self) {
                            index in SquareView(index: index)
                        }
                        
                    }
                }
                .disabled(game.boardDisabled)
                
                VStack {
                    if game.gameOver {
                        Text("GameOver")
                        if game.possiblMoves.isEmpty{
                            Text("Noboy Wins")
                        }else {
                            Text("\(game.currrentPlayer.name) wins")
                        }
                        
                        Button("new Game"){
                            game.reset()
                        }.buttonStyle(.borderedProminent)
                    }
                    
                }.font(.largeTitle)

                Spacer()
    
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing ){
                    Button("end game"){
                        dismiss()
                    }
                    .buttonStyle(.bordered)
                }
            }
            .navigationTitle("ticktacktoe")
            .onAppear{game.reset()}
        }
    }
}

struct GamePantalla_Previews: PreviewProvider {
    static var previews: some View {
        GamePantalla().environmentObject(GameService())
    }
}




struct PlayerButtonStyle: ButtonStyle {
    let isCurrent: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(8)
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(isCurrent ? Color.green : Color.gray)
            )
            .foregroundColor(.white)
    }
}
