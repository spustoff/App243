//
//  MainDetail.swift
//  App243
//
//  Created by Вячеслав on 11/6/23.
//

import SwiftUI

struct MainDetail: View {
    
    let index: MainModel
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Image("img")
                    .resizable()
                    .frame(height: 250)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    LazyVStack(alignment: .leading) {
                        
                        Text("Price ")
                            .foregroundColor(.black)
                            .font(.system(size: 18, weight: .regular)) +
                        
                        Text("$\(index.price)")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(height: 1)
                        
                        Text("Formats ")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular)) +
                        
                        Text(index.formats ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        Rectangle()
                            .fill(.gray.opacity(0.2))
                            .frame(height: 1)
                        
                        Text("Sites ")
                            .foregroundColor(.gray)
                            .font(.system(size: 18, weight: .regular)) +
                        
                        Text(index.sites ?? "")
                            .foregroundColor(.black)
                            .font(.system(size: 20, weight: .semibold))
                        
                        VStack(alignment: .center, spacing: 6, content: {
                            
                            Text("Earned on this selected platform")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.center)
                            
                            Text("$0")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .bold))
                        })
                        .padding(.vertical, 100)
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    router.wrappedValue.dismiss()
                    
                }, label: {
                    
                    Text("Done")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
            }
            .ignoresSafeArea(.all, edges: .top)
            
            VStack {
                
                HStack {
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .medium))
                            .padding(10)
                            .background(Circle().fill(.black.opacity(0.3)))
                    })
                    
                    Spacer()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

//#Preview {
//    MainDetail()
//}
