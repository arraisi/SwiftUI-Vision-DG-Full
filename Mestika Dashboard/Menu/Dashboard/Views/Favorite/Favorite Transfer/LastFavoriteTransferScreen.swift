//
//  LastFavoriteTransferScreen.swift
//  Mestika Dashboard
//
//  Created by Prima Jatnika on 27/10/20.
//

import SwiftUI

struct LastFavoriteTransferScreen: View {
    
    @Binding var dataFavorit: TransactionFavorit
    
    var body: some View {
        ZStack {
            Color(hex: "#F6F8FB")
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("\(dataFavorit.username)")
                            .foregroundColor(.white)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 5)
                            .textCase(/*@START_MENU_TOKEN@*/.uppercase/*@END_MENU_TOKEN@*/)
                            .lineLimit(2)
                        
                        HStack {
                            Text("\(dataFavorit.namaBank) :")
                                .foregroundColor(.white)
                                .font(.caption)
                                .fontWeight(.light)
                            
                            Text("\(dataFavorit.norek)")
                                .foregroundColor(.white)
                                .font(.caption)
                                .fontWeight(.light)
                        }
                    }
                    .padding(.leading, 20)
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("ic_edit")
                                .resizable()
                                .frame(width: 20, height: 20)
                        })
                        
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Image("ic_trash")
                                .resizable()
                                .frame(width: 20, height: 20)
                        })
                    }
                    .padding(.horizontal, 40)
                    .padding(.top, 30)
                }
                .padding(.vertical, 20)
                .background(Color(hex: "#232175"))
                
                ScrollView(.vertical, showsIndicators: false, content: {
                    ListLastTransactionView()
                    .padding(.bottom, 25)
                })
                
                VStack {
                    Button(action: {}, label: {
                        Text("Lakukan Transfer")
                            .foregroundColor(.white)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .font(.system(size: 13))
                            .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                        
                    })
                    .background(Color(hex: "#2334D0"))
                    .cornerRadius(12)
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                    .shadow(color: Color.gray.opacity(0.3), radius: 10)
                }
                .padding(.bottom)
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

#if DEBUG
struct LastFavoriteTransferScreen_Previews: PreviewProvider {
    static var previews: some View {
        
        let data = TransactionFavorit(id: 1, username: "Prima Jatnika", namaBank: "BNI", norek: "9019030900")
        
        LastFavoriteTransferScreen(dataFavorit: .constant(data))
    }
}
#endif
