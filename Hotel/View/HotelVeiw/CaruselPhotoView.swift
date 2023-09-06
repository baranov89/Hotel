//
//  CaruselPhotoView.swift
//  Hotel
//
//  Created by Алексей Баранов on 06.09.2023.
//

import SwiftUI

struct CaruselPhotoView: View {
    var urlPhoto: [String] = []
    
    var body: some View {
        TabView {
            ForEach(urlPhoto, id:\.self) { url in
                AsyncImage(url: URL(string: url)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                    case .failure:
                        Image(systemName: "photo")
                    @unknown default:
                        EmptyView()
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct CaruselPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        CaruselPhotoView()
    }
}
