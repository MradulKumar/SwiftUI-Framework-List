//
//  FrameworkDetailView.swift
//  SwiftUI-Frameworks
//
//  Created by Mradul Kumar  on 04/09/24.
//

import SwiftUI

struct FrameworkDetailView: View {
    let framework: Framework
    
    @Binding var isShowingDetailView: Bool
    
    @State var isShowingSafariView: Bool = false
    
    var body: some View {
        VStack {
            
            //XDismissButton(isShowingModel: $isShowingDetailView)
            
            Spacer()
            
            FrameworkTitleView(framework: framework)
            
            ScrollView {
                Text(framework.description)
                    .font(.body)
                    .padding()
            }
            
            Spacer()
            
            Button {
                isShowingSafariView = true
            } label: {
                AFButton(title: "Learn More")
            }
            .padding()
            
        }
        .fullScreenCover(isPresented: $isShowingSafariView, content: {
            let url = URL(string: framework.urlString) ?? URL(string: "www.apple.com")!
            SafariView(url: url)
        })
//        .sheet(isPresented: $isShowingSafariView, content: {
//            let url = URL(string: framework.urlString) ?? URL(string: "www.apple.com")!
//            SafariView(url: url)
//        })
    }
}

struct FrameworkDetailView_Preview: PreviewProvider {
    static var previews: some View {
        FrameworkDetailView(framework: MockData.sampleFramework,
                            isShowingDetailView: .constant(false))
            .preferredColorScheme(.dark)
    }
}

struct AFButton: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title2)
            .fontWeight(.semibold)
            .frame(width: 200, height: 60, alignment: .center)
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
