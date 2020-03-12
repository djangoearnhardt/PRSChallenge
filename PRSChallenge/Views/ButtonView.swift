//
//  ButtonView.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/11/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

struct ButtonView: View {
    var textLabel: String
    var body: some View {
        Button(action: {
            debugPrint(self.textLabel)
        }) {
            HStack {
                ButtonIcon(name: textLabel)
                    .font(.headline)
                Text(textLabel)
                    .font(.headline)
                    .frame(width: 100)
            }
        }
        .padding()
        .foregroundColor(.black)
        .background(Color.orange)
        .cornerRadius(40)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(textLabel: "Buttoned")
    }
}
