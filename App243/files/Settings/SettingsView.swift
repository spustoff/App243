//
//  SettingsView.swift
//  App243
//
//  Created by Вячеслав on 11/6/23.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                VStack(spacing: 20, content: {
                    
                    Button(action: {
                        
                        guard let url = URL(string: "https://docs.google.com/document/d/1Lz649sTP7PCwmMvInO7jDLYfBFbAZJ6dLOph7HXTf1I/edit?usp=sharing") else { return }
                        
                        UIApplication.shared.open(url)
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "doc.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text("Usage Policy")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                        .padding(.horizontal)
                    })
                    
                    Button(action: {
                        
                        SKStoreReviewController.requestReview()
                        
                    }, label: {
                        
                        HStack {
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(Color("primary"))
                                .font(.system(size: 19, weight: .semibold))
                            
                            Text("Rate Us")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                            
                            Spacer()
                            
                            Image(systemName: "chevron.right")
                                .foregroundColor(.gray)
                                .font(.system(size: 13, weight: .regular))
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                        .padding(.horizontal)
                    })
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    SettingsView()
}
