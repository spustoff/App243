//
//  CalendarView.swift
//  App243
//
//  Created by Вячеслав on 11/6/23.
//

import SwiftUI

struct CalendarView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Calendar")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack {
                        
                        ForEach(["June", "July", "August", "September", "October", "November", "December"], id: \.self) { index in
                        
                            VStack(alignment: .center, spacing: 5, content: {
                                
                                Text(index)
                                    .foregroundColor(.black)
                                    .font(.system(size: 15, weight: .medium))
                                
                                Text("2023")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 18, weight: .semibold))
                            })
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 15).stroke(.gray.opacity(0.2)))
                        }
                    }
                    .padding(.horizontal)
                }
                
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
    CalendarView()
}
