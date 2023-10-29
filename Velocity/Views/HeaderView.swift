//
//  HeaderView.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/29/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String;
    let titleSize: CGFloat;
    let subtitle: String;
    let subtitleSize: CGFloat;
    let backgroundColor: Color;
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
            VStack {
                Text(title)
                    .font(.system(size: titleSize))
                    .foregroundColor(Color.white)
                    .bold();
                
                Text(subtitle)
                    .font(.system(size: 30))
                    .foregroundColor(Color.white)
            }
        }
        .frame(width: UIScreen.main.bounds.width, height: 400)
        .offset(y: -100)
    }
}

#Preview {
    HeaderView(title: "", titleSize: 50, subtitle: "", subtitleSize: 30, backgroundColor: .black);
}
