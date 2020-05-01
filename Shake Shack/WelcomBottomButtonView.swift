//
//  WelcomBottomButtonView.swift
//  Shake Shack
//
//  Created by Al Amin on 29/4/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct WelcomBottomButtonView: View {
    let button = [ButtonWithImage(image: "clock", label: "History"), ButtonWithImage(image: "bag", label: "Menu")]
    var body: some View {
        
        GeometryReader { geometry in
            HStack {
                ForEach(self.button, id: \.self){ button in
                    
                    Button(action: {
                        print(button.label)
                    }) {
                        Image(systemName: button.image)
                            .font(.title)
                            .foregroundColor(.green)
                        Text(button.label)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                    }
                    .frame(width: geometry.size.width / 2.2, height: 60)
                    .background(Color.white)
                .cornerRadius(18)
                    .shadow(color: Color(.black).opacity(0.4), radius: 4, x: 0, y: 0)
                    .padding(.horizontal)
                    

                }
            }
        }
    .frame( height: 60)
        .padding()
    }
}

struct ButtonWithImage: Hashable {
    let image: String
    let label: String
}

struct WelcomBottomButtonView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomBottomButtonView()
    }
}
