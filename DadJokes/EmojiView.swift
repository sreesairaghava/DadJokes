//
//  EmojiView.swift
//  DadJokes
//
//  Created by Sree Sai Raghava Dandu on 18/04/20.
//  Copyright © 2020 Sree Sai Raghava. All rights reserved.
//

import SwiftUI

struct EmojiView: View {
    var rating: String
    var body: some View {
        switch rating {
        case "Sob":
            return Text("😒")
        case "Sigh":
            return Text("🙁")
        case "Smirk":
            return Text("😏")
        default:
            return Text("🤫")
        }
    }
    init(for rating: String) {
        self.rating = rating
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(for: "Smirk")
    }
}
