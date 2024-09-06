//
//  XDismissButton.swift
//  SwiftUI-Frameworks
//
//  Created by Mradul Kumar  on 04/09/24.
//

import SwiftUI

struct XDismissButton: View {
    
    @Binding var isShowingModel: Bool
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                isShowingModel = false
            } label: {
                Image(systemName: "xmark")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 45, height: 45, alignment: .center)
            }
        }
        .padding()
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton(isShowingModel: .constant(false))
    }
}
