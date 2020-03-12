//
//  ButtonIcon.swift
//  PRSChallenge
//
//  Created by Sam Lobue on 3/11/20.
//  Copyright © 2020 Sam Lobue. All rights reserved.
//

import SwiftUI

struct ButtonIcon: View {
    var name: String

    var body: some View {
        Image(name)
            .resizable()
            .aspectRatio(contentMode: .fit)
        .frame(width: 25, height: 25)
    }
}

struct ButtonIcon_Previews: PreviewProvider {
    static var previews: some View {
        ButtonIcon(name: "rock")
    }
}

