//
//  ContentView.swift
//  bottle
//
//  Created by Kekko Paciello on 06/07/21.
//

import SwiftUI

struct ContentView: View {
    @State private var degrees = 0.0
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.9685322642, green: 0.9686941504, blue: 0.9685109258, alpha: 1)).ignoresSafeArea()
            VStack(spacing: 40){
                Text("Bottle Spin Game")
                    .bold()
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(.green)
                
                Image("bottle")
                    .resizable()
                    .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .scaledToFit()
                    .rotationEffect(.degrees(degrees))
                    .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                                .onChanged({ value in
                                    if value.translation.height < 0 && value.translation.height > -150{
                                        withAnimation{
                                            degrees = degrees - Double(value.translation.height) / 6
                                        }
                                    }
                                })
                                
                                .onEnded({ value in
                                    
                                    if value.translation.height < -150 {
                                        withAnimation(Animation.easeInOut(duration: 3)){
                                            degrees = degrees + Double.random(in: 0...3000)
                                        }
                                    }

                                }))
                
                Button(action: {
                    withAnimation(Animation.easeInOut(duration: 3)){
                        degrees = Double.random(in: 0...3000)
                    }
                }, label: {
                    ZStack{
                        RoundedRectangle(cornerRadius: 12)

                        Text("Spin")
                            .bold()
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(width: UIScreen.main.bounds.width, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()

                })
                
                Text("Or Swipe Up on the Bottle ⬆️")
                    .font(.headline)
                
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
