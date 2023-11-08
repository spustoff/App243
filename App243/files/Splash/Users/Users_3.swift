//
//  Users_3.swift
//  App243
//
//  Created by Вячеслав on 11/3/23.
//

import SwiftUI

struct Users_3: View {
    
    let telegram: URL
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                VStack(alignment: .center, spacing: 8, content: {
                    
                    Text("Join and earn")
                        .foregroundColor(Color(red: 0/255, green: 163/255, blue: 255/255))
                        .font(.system(size: 22, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Join our Telegram group trade with our team")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 30)
                
                Spacer()
                
                HStack {
                    
                    NavigationLink(destination: {
                        
                        Users_4()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 45, height: 45)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    })
                    
                    Button(action: {
                        
                        UIApplication.shared.open(telegram)
                        
                    }, label: {
                        
                        Text("Join")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color(red: 0/255, green: 163/255, blue: 255/255)))
                            .padding()
                    })
                }
                .padding(.horizontal, 35)
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    Users_3(telegram: URL(string: "h")!)
}
