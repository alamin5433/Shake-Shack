//
//  ContentView.swift
//  Shake Shack
//
//  Created by Al Amin on 27/4/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var isBottomViewOnScreen = false
    @State private var isSignUpViewOnScreen = false
    @State private var isMenuViewOnScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundImageView()
                VStack {
                    MenuButtonView()
                        .offset( y: isMenuViewOnScreen ? 0 : -400)
                        .animation(.spring(dampingFraction: 0.8))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                self.isMenuViewOnScreen.toggle()
                            }
                    }
                    Spacer()
                    WelcomeTextView()
                    
                    
                    Spacer()
                    NavigationLink(destination: Text("Coming Soon")) {
                        SignInOrCreateButtonView()
                    }
                    .offset( y: isSignUpViewOnScreen ? 0 : 400)
                        .animation(.spring(dampingFraction: 0.6))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
                                self.isSignUpViewOnScreen.toggle()
                            }
                    }
                    
                   // Spacer()
                    BottomView()
                    .offset( y: isBottomViewOnScreen ? 0 : 400)
                        .animation(.spring(dampingFraction: 0.4))
                        .onAppear {
                            
                                self.isBottomViewOnScreen.toggle()
                    }
                    
                }
                .frame(width: UIScreen.main.bounds.width)
                .edgesIgnoringSafeArea(.bottom)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct MenuButtonView: View {
    var body: some View {
        HStack {
            Button(action: {
                print("Menu Button tapped")
            }) {
                Image(systemName: "line.horizontal.3.decrease.circle.fill")
                    .font(.system(size: 44))
                    .foregroundColor(.white)
            }
            .padding()
            Spacer()
        }
    }
}

struct WelcomeTextView: View {
    var body: some View {
        VStack {
            Text("Sip our new\ncascara shake!")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
            Text("Our newest shake is sweet + fruity with\nnotes of cherry + red currany.")
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            
        }
    }
}

struct SignInOrCreateButtonView: View {
    var body: some View {
        HStack {
            Image(systemName: "bag")
                .font(.largeTitle)
                .foregroundColor(.green)
            VStack(alignment: .leading) {
                Text("Let's get shackin' !")
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                
                Text("Sign in or create an account")
                    .foregroundColor(.secondary)
                
            }
            .padding(.horizontal)
            Spacer()
            
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(18)
        .padding(.horizontal,8)
    }
}

struct BottomView: View {
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Choose a Shack")
                        .font(.title)
                        .fontWeight(.heavy)
                    Text("Start by choosing a location")
                }
                Spacer()
                
                Button(action: {
                    print("Start")
                }) {
                    ZStack {
                        Capsule()
                            .foregroundColor(.green)
                            .frame(width: 120, height: 60)
                        Text("Start")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                    }
                    
                }
            }
            .padding()
            WelcomBottomButtonView()
        }
        
        .edgesIgnoringSafeArea(.bottom)
        .frame(width: UIScreen.main.bounds.width, height: 240)
        .background(Color.white)
    .cornerRadius(18)
  //  .padding()
    }
}
