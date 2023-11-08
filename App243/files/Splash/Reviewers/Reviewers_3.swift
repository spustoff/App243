//
//  Reviewers_3.swift
//  App243
//
//  Created by Вячеслав on 11/3/23.
//

import SwiftUI

struct Reviewers_3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("reviewers_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                VStack(alignment: .center, spacing: 8, content: {
                    
                    Text("Income table")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 22, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("See all your earnings on one screen")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 30)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .regular))
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                        .padding(.horizontal, 50)
                })
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    Reviewers_3()
}
