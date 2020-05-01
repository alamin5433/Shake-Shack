//
//  BackgroundImageView.swift
//  Shake Shack
//
//  Created by Al Amin on 27/4/20.
//  Copyright © 2020 Al Amin. All rights reserved.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        ZStack {
            Image("jar")
            .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                
            
            Rectangle()
                .opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
        }
    }
}

struct BackgroundImageView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundImageView()
    }
}
