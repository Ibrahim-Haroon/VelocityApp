//
//  VButton.swift
//  Velocity
//
//  Created by Ibrahim Haroon on 10/29/23.
//

import SwiftUI

struct VButton: View {
    let buttonText: String;
    let backgroundColor: Color;
    let action: () -> Void;
    var body: some View {
        Button {
            // Attempt login
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(backgroundColor)
                
                Text(buttonText)
                    .foregroundColor(Color.white)
                    .bold()
                
            }
        }    }
}

#Preview {
    VButton(buttonText: "", backgroundColor: .blue) {
        // action
    }
}
