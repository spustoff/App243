//
//  MainAdd.swift
//  App243
//
//  Created by Вячеслав on 11/6/23.
//

import SwiftUI

struct MainAdd: View {
    
    @Environment(\.presentationMode) var router

    @StateObject var viewModel: MainViewModel
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Adding an image")
                    .foregroundColor(.black)
                    .font(.system(size: 16, weight: .medium))
                    .padding(.top, 32)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack(spacing: 20) {
                        
                        Image("img")
                            .resizable()
                            .frame(height: 200)
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Price")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("$100.00")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.price.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.price)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                                    .keyboardType(.decimalPad)
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.15)))
                        })
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("Image formats")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.formats.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.formats)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.15)))
                        })
                        
                        VStack(alignment: .leading, spacing: 8, content: {
                            
                            Text("On what sites is it sold?")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .medium))
                            
                            ZStack(alignment: .leading, content: {
                                
                                Text("Enter")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 15, weight: .regular))
                                    .opacity(viewModel.sites.isEmpty ? 1 : 0)
                                
                                TextField("", text: $viewModel.sites)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .regular))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).fill(.gray.opacity(0.15)))
                        })
                    }
                    .padding()
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.addImage {
                        
                        viewModel.fetchImages()
                        
                        router.wrappedValue.dismiss()
                        
                        viewModel.formats = ""
                        viewModel.price = ""
                        viewModel.sites = ""
                    }
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        .padding()
                })
                .opacity(viewModel.price.isEmpty || viewModel.formats.isEmpty || viewModel.sites.isEmpty ? 0.5 : 1)
                .disabled(viewModel.price.isEmpty || viewModel.formats.isEmpty || viewModel.sites.isEmpty ? true : false)
            }
        }
    }
}

#Preview {
    MainAdd(viewModel: MainViewModel())
}
