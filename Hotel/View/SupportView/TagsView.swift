//
//  TagsView.swift
//  Hotel
//
//  Created by Алексей Баранов on 11.09.2023.
//

import SwiftUI

struct TagsView: View {
    @StateObject var vm: TagsViewModel
    
    init(data: [String]) {
        self._vm = StateObject(wrappedValue: TagsViewModel(items: data))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(vm.groupedItems, id: \.self) {tegsArray in
                HStack{
                    ForEach(tegsArray, id: \.self) { teg in
                        Text(teg)
                            .font(.system(size: 15))
                            .padding(.horizontal, 5)
                            .padding(.vertical, 5)
                            .background(.gray.opacity(0.1))
                            .cornerRadius(5)
                            .lineLimit(1)
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width - 32, alignment: .leading)
    }
    
 
}

struct TagsView_Previews: PreviewProvider {
    static var previews: some View {
        TagsView(data: ["asdasdf", "asdad", "ergweg"])
    }
}
