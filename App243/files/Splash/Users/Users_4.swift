//
//  Users_4.swift
//  App243
//
//  Created by Вячеслав on 11/3/23.
//

import SwiftUI
import OneSignalFramework

struct Users_4: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_4")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    
                VStack(alignment: .center, spacing: 8, content: {
                    
                    Text("Don’t miss anything")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 22, weight: .semibold))
                        .multilineTextAlignment(.center)
                    
                    Text("Don’t miss the most userful information")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 15, weight: .regular))
                        .multilineTextAlignment(.center)
                })
                .padding(.top, 30)
                
                Spacer()
                
                HStack {
                    
                    Button(action: {
                        
                        status = true
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.system(size: 16, weight: .regular))
                            .frame(width: 45, height: 45)
                            .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.2)))
                    })
                    
                    Button(action: {
                        
                        OneSignal.Notifications.requestPermission({ accepted in
                          print("User accepted notifications: \(accepted)")
                        }, fallbackToSettings: true)
                        
                    }, label: {
                        
                        Text("Enable Notifications")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .regular))
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            .padding()
                    })
                }
                .padding(.horizontal, 50)
            }
            .ignoresSafeArea(.all, edges: .top)
        }
    }
}

#Preview {
    Users_4()
}
