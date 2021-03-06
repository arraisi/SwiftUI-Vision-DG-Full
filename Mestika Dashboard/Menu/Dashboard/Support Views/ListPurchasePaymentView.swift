//
//  ListPurchasePaymentView.swift
//  Mestika Dashboard
//
//  Created by Prima Jatnika on 22/10/20.
//

import SwiftUI

struct ListPurchasePaymentView: View {
    
    @State var date = Date()
    
    var _listTransaksi = [
        PurchasePayment(id: 1, tanggalTransaksi: "21 November 2020", namaTransaksi: "Pulsa Pra-Bayar", total: "600.000"),
        PurchasePayment(id: 2, tanggalTransaksi: "4 Oktober 2020", namaTransaksi: "TV & Internet Kabel", total: "1.200.000")
    ]
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Purchase & Payment")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom, 5)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                    
                    Text("Pembelian dan Pembayaran berbagai macam produk.")
                        .font(.caption)
                        .fontWeight(.ultraLight)
                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                }
                .padding(.leading, 20)
                
                Spacer()
                
                Image("ic_online_shoping")
                    .padding(.horizontal, 20)
            }
            .padding(.vertical, 20)
            
            HStack {
                Text("Transaksi terakhir")
                    .font(.subheadline)
                    .fontWeight(.light)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Lihat daftar selengkapnya")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "#2334D0"))
                })
            }
            .padding(.horizontal, 20)
            
            HStack {
                DatePicker("", selection: self.$date, in: ...Date(), displayedComponents: .date)
                    .labelsHidden()
                
                DatePicker("", selection: self.$date, in: ...Date(), displayedComponents: .date)
                    .labelsHidden()
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            
            List {
                ForEach(_listTransaksi) { data in
                    HStack {
                        ZStack {
                            Image("ic_topup_ewallet")
                        }
                        
                        VStack(alignment: .leading) {
                            Text("\(data.tanggalTransaksi)")
                                .font(.caption)
                                .fontWeight(.ultraLight)
                            
                            HStack {
                                Text("\(data.namaTransaksi)")
                                    .font(.subheadline)
                                    .fontWeight(.light)
                                
                                Spacer()
                                
                                Text("- Rp \(data.total)")
                                    .font(.subheadline)
                                    .foregroundColor(.red)
                                    .fontWeight(.light)
                            }
                        }
                    }.padding(.vertical, 5)
                }
            }.frame(height: 300)
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
    }
}

struct ListPurchasePaymentView_Previews: PreviewProvider {
    static var previews: some View {
        ListPurchasePaymentView()
    }
}
