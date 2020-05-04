//
//  LoginView.swift
//  Shake Shack
//
//  Created by Al Amin on 2/5/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            ZStack {
                Circle()
                    .offset(x: 2)
                .stroke(lineWidth: 1)
                    .foregroundColor(.gray)
                Image(systemName: "chevron.left")
                .padding()
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
    }
    @State private var steps = 0
    @State private var email = ""
    let buttons = [ButtonWithImages(image: "person.crop.circle", label: "Continue with Facebook"), ButtonWithImages(image: "person.crop.circle", label: "Continew with Google")]
    
    var body: some View {
        NavigationView {
            VStack {
                GetTheGoodsTextView()
                if steps == 0 {
                    LoginTextFieldView(email: $email)
                }else{
                    LoginTextFieldView(email: $email)
                    LoginTextFieldView(email: $email)
                }
                if email.isEmpty{
                    GeometryReader { geometry in
                        VStack {
                            Text("or")
                            ForEach(self.buttons, id: \.self){ button in
                                Button(action: {
                                    print("")
                                }) {
                                        Text(button.label)
                                            .fontWeight(.heavy)
                                            .foregroundColor(.black)
                                        Image(systemName: button.image)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                }
                                .frame(width: geometry.size.width / 1, height: 60)
                                .background(Color.white)
                            .cornerRadius(18)
                                .shadow(color: Color(.black).opacity(0.4), radius: 2, x: 0, y: 0)
                                .padding(.vertical, 4)
                            
                            }
                        
                        }
                    
                    }
                    .frame( height: 120)
                    .padding()
                }else{
                    ContinueButtonView(steps: $steps)
                }
                Spacer()
            }
        }
    .navigationBarBackButtonHidden(true)
    .navigationBarItems(leading: backButton)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

struct GetTheGoodsTextView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text("Get the goods!")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(.bottom)
                
                Text("Sign In or Create an Account")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
    }
}

struct LoginTextFieldView: View {
    @Binding var email: String
    var body: some View {
        TextField("Enter your email", text: $email)
            .keyboardType(.emailAddress)
            .padding()
            .background(Color(#colorLiteral(red: 0.9646012187, green: 0.9647662044, blue: 0.9645908475, alpha: 1)))
            .cornerRadius(18)
            .padding()
    }
}

struct ButtonWithImages:Hashable {
    let image: String
    let label: String
}

struct ContinueButtonView: View {
    @Binding var steps: Int
    var body: some View {
        Button(action: {
            self.steps += 1
            print(self.steps)
        }) {
            Text("Continue")
                .fontWeight(.heavy)
                .foregroundColor(.white)
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 24, height: 60)
        .background(Color.green)
        .cornerRadius(18)
    }
}
