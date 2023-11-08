//
//  MainView.swift
//  App243
//
//  Created by Вячеслав on 11/6/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                VStack(alignment: .center, spacing: 10, content: {
                    
                    Text("November, 2023")
                        .foregroundColor(.black)
                        .font(.system(size: 19, weight: .medium))
                    
                    Text("$\(viewModel.images.map(\.price).reduce(0, +))")
                        .foregroundColor(Color("primary"))
                        .font(.system(size: 19, weight: .bold))
                })
                .padding(.top)
                
                Rectangle()
                    .fill(.gray.opacity(0.3))
                    .frame(height: 1)
                
                NavigationLink(destination: {
                    
                    MainChart()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 5, content: {
                            
                            Text("Purchase currency")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                                .multilineTextAlignment(.leading)
                            
                            Text("EUR/USD")
                                .foregroundColor(.black)
                                .font(.system(size: 16, weight: .medium))
                        })
                        
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.5)))
                    .padding([.horizontal, .top])
                })
                
                if viewModel.images.isEmpty {
                    
                    VStack(alignment: .center, spacing: 5, content: {
                        
                        Text("Empty")
                            .foregroundColor(Color("primary"))
                            .font(.system(size: 19, weight: .medium))
                        
                        Text("You don't have any profile pictures added yet")
                            .foregroundColor(.black.opacity(0.4))
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding()
                    .frame(maxHeight: .infinity, alignment: .center)
                    
                } else {
                    
                    ScrollView(.vertical, showsIndicators: true) {
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach(viewModel.images, id: \.self) { index in
                            
                                Button(action: {
                                    
                                    viewModel.selectedModel = index
                                    viewModel.isDetail = true
                                    
                                }, label: {
                                    
                                    VStack(alignment: .leading, spacing: 10, content: {
                                        
                                        Image("img")
                                            .resizable()
                                            .frame(height: 120)
                                            .cornerRadius(10)
                                        
                                        Text(index.formats ?? "")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .medium))
                                            .multilineTextAlignment(.leading)
                                        
                                        Text("$\(index.price)")
                                            .foregroundColor(.black)
                                            .font(.system(size: 15, weight: .regular))
                                            .multilineTextAlignment(.leading)
                                    })
                                })
                            }
                        })
                        .padding()
                    }
                }
                
                Spacer()
                
                Button(action: {
                    
                    viewModel.isAdd = true
                    
                }, label: {
                    
                    Text("Add")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(Color("primary"))
                })
            }
        }
        .sheet(isPresented: $viewModel.isAdd, content: {
            
            MainAdd(viewModel: viewModel)
        })
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            if let index = viewModel.selectedModel {
                
                MainDetail(index: index)
            }
        })
        .onAppear {
            
            viewModel.fetchImages()
        }
    }
}

#Preview {
    MainView()
}
