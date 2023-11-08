//
//  Users_2.swift
//  App243
//
//  Created by Вячеслав on 11/3/23.
//

import SwiftUI
import StoreKit

struct Users_2: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                VStack(alignment: .center, spacing: 8, content: {
                    
                    Text("Rate our app in the AppStore")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 22, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Help make the app even better")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 30)
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                   
                        Users_3(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Users_4()
                            .navigationBarBackButtonHidden()
                    }
                    
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
        .onAppear {
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Users_2(telegram: URL(string: "h")!, isTelegram: false)
}
