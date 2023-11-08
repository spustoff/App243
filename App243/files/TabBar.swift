//
//  TabBar.swift
//  App243
//
//  Created by Вячеслав on 11/3/23.
//

import SwiftUI

struct TabBar: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        
        HStack {
            
            ForEach(Tab.allCases, id: \.self) { index in
                
                Button(action: {
                    
                    selectedTab = index
                    
                }, label: {
                    
                    VStack(alignment: .center, spacing: 10, content: {
                        
                        Image(index.rawValue)
                            .renderingMode(.template)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .frame(width: 22, height: 22)
                        
                        Text(index.rawValue)
                            .foregroundColor(selectedTab == index ? Color("primary") : Color.gray)
                            .font(.system(size: 13, weight: .regular))
                    })
                    .frame(maxWidth: .infinity)
                })
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.top, 13)
        .padding(.bottom, 30)
        .background(Color("bg"))
    }
}

enum Tab: String, CaseIterable {
    
    case Main = "Main"
    
    case Statistics = "Statistics"
    
    case Calendar = "Calendar"
    
    case Settings = "Settings"
    
}

#Preview {
    ContentView()
}


