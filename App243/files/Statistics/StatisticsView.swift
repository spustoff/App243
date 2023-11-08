//
//  StatisticsView.swift
//  App243
//
//  Created by Вячеслав on 11/6/23.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                Text("Statistics")
                    .foregroundColor(.black)
                    .font(.system(size: 25, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        HStack {
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Money earned")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("$\(viewModel.images.map(\.price).reduce(0, +))")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .bold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                            
                            VStack(alignment: .leading, spacing: 5, content: {
                                
                                Text("Number of purchases")
                                    .foregroundColor(.white)
                                    .font(.system(size: 13, weight: .regular))
                                
                                Text("\(viewModel.images.count)")
                                    .foregroundColor(.white)
                                    .font(.system(size: 19, weight: .bold))
                            })
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        }
                        .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Most profitable month")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("November, 2023")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .bold))
                            
                            Text("+\(viewModel.images.map(\.price).reduce(0, +))")
                                .foregroundColor(.green)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Most profitable image")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("+\(viewModel.images.map(\.price).reduce(0, +))")
                                .foregroundColor(.green)
                                .font(.system(size: 14, weight: .regular))
                            
                            Image("img")
                                .resizable()
                                .frame(width: 200, height: 150)
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        
                        VStack(alignment: .leading, spacing: 10, content: {
                            
                            Text("Where to shop more?")
                                .foregroundColor(.black)
                                .font(.system(size: 14, weight: .regular))
                            
                            Text("No data")
                                .foregroundColor(.black)
                                .font(.system(size: 19, weight: .bold))
                            
                            Text("0")
                                .foregroundColor(.gray)
                                .font(.system(size: 14, weight: .regular))
                        })
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    }
                }
            }
        }
    }
}

#Preview {
    StatisticsView()
}
