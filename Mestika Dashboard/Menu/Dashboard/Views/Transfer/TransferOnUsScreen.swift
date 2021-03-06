//
//  TransferOnUsScreen.swift
//  Mestika Dashboard
//
//  Created by Prima Jatnika on 23/10/20.
//

import SwiftUI
import BottomSheet

struct TransferOnUsScreen: View {
    
    @State private var showBottomSheet = false
    @State var norek: String = ""
    @State var nominal: String = ""
    
    var body: some View {
        ZStack {
            Color(hex: "#F6F8FB")
            VStack {
//                Color(hex: "#2334D0")
//                    .edgesIgnoringSafeArea(.top)
//                    .frame(height: 0)
                
                ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                    VStack {
                        noRekeningCard
                        nominalCard
                        
                        calendarCard
                        frekuensiTransaksiCard
                        chooseVoucherCard
                        notesCard
                        
                        Spacer()
                        
                        VStack {
                            Button(action: {
                                self.showBottomSheet.toggle()
                            }, label: {
                                Text("KONFIRMASI TRANSFER")
                                    .foregroundColor(.white)
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                    .font(.system(size: 13))
                                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                            })
                            .background(Color(hex: "#2334D0"))
                            .cornerRadius(12)
                            .padding(.leading, 20)
                            .padding(.trailing, 10)
                            .padding(.bottom)
                        }
                    }
                })
            }
            .navigationBarTitle("Transfer Antar Sesama", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {}, label: {
                Text("Cancel")
            }))
            
        }
        .bottomSheet(isPresented: $showBottomSheet, height: 300) {
            bottomSheetCard
        }
    }
    
    var noRekeningCard: some View {
        VStack {
            HStack {
                Text("No Rekening Tujuan")
                    .font(.subheadline)
                    .fontWeight(.light)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            
            VStack {
                TextField("Rekening", text: $norek, onEditingChanged: { changed in
                    print("\($norek)")
                })
                .keyboardType(.numberPad)
                .frame(height: 10)
                .font(.subheadline)
                .padding()
                .background(Color(hex: "#F6F8FB"))
                .cornerRadius(15)
                .padding(.horizontal, 20)
            }
            .padding(.bottom, 25)
            
            
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
        .padding()
    }
    
    var nominalCard: some View {
        VStack {
            HStack {
                Text("Jumlah Besaran (Rp)")
                    .font(.subheadline)
                    .fontWeight(.ultraLight)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            
            HStack(alignment: .top) {
                Text("Rp.")
                    .foregroundColor(Color(hex: "#232175"))
                    .fontWeight(.bold)
                TextField("0", text: $nominal)
                    .foregroundColor(Color(hex: "#232175"))
                    .font(.system(size: 40, weight: .bold, design: .default))
                    .keyboardType(.numbersAndPunctuation)
                
                Spacer()
            }
            .padding(.top, 5)
            .padding(.bottom, 1)
            .padding(.horizontal, 25)
            
            HStack {
                Text("Limit Transaksi")
                    .font(.subheadline)
                    .fontWeight(.ultraLight)
                
                Spacer()
                
                HStack(alignment: .top) {
                    Text("Rp.")
                        .foregroundColor(.red)
                        .font(.caption2)
                        .fontWeight(.bold)
                    Text("900.000")
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .fontWeight(.bold)
                }
            }
            .padding(.top, 5)
            .padding(.horizontal, 25)
            
            Divider()
                .padding(.horizontal, 25)
                .padding(.bottom, 10)
            
            ListBankAccountView()
                .padding(.bottom, 25)
            
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
        .padding()
    }
    
    var calendarCard: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Sekarang")
                        .font(.subheadline)
                        .foregroundColor(Color(hex: "#232175"))
                        .fontWeight(.semibold)
                }
                
                Spacer()
                
                Image(systemName: "calendar")
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
    }
    
    var frekuensiTransaksiCard: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Pilih Frekuensi Transaksi")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .fontWeight(.light)
                }
                
                Spacer()
                
                Image(systemName: "chevron.down")
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
    }
    
    var chooseVoucherCard: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Pilih Voucher")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .fontWeight(.light)
                }
                
                Spacer()
                
                Image(systemName: "chevron.down")
            }
            .padding()
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
    }
    
    var notesCard: some View {
        VStack {
            HStack {
                Text("Catatan")
                    .font(.subheadline)
                    .fontWeight(.light)
                
                Spacer()
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
            
            VStack {
                TextField("Tulis keterangan Transaksi disini", text: $norek, onEditingChanged: { changed in
                    print("\($norek)")
                })
                .lineLimit(5)
                .multilineTextAlignment(.leading)
                .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity, alignment: .topLeading)
            }
            .padding(.horizontal, 20)
            .padding(.top, 5)
            .padding(.bottom, 25)
            
            
        }
        .frame(width: UIScreen.main.bounds.width - 30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
        .padding()
    }
    
    var bottomSheetCard: some View {
        VStack {
            HStack {
                Text("Nomor Rekening Terkonfirmasi")
                    .foregroundColor(.green)
                    .font(.subheadline)
                    .fontWeight(.light)
                
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 20)
            
            HStack {
                ZStack {
                    Circle()
                        .fill(Color.secondary)
                        .frame(width: 30, height: 30)
                    
                    Text("A")
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                }
                
                VStack(alignment: .leading) {
                    Text("Prima Jatnika")
                        .font(.subheadline)
                    
                    HStack {
                        Text("Mestika :")
                            .font(.caption)
                            .fontWeight(.ultraLight)
                        Text("8809091230903")
                            .font(.caption)
                            .fontWeight(.ultraLight)
                    }
                }
                
                Spacer()
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 20)
            
            Divider()
                .padding(.horizontal, 10)
                .padding(.bottom, 20)
            
            VStack {
                NavigationLink(destination: TransferOnUsConfirmationScreen(), label: {
                    Text("KONFIRMASI TRANSFER")
                        .foregroundColor(.white)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .font(.system(size: 13))
                        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                })
                .background(Color(hex: "#2334D0"))
                .cornerRadius(12)
                .padding(.leading, 20)
                .padding(.trailing, 10)
            }
            .padding(.bottom, 20)
        }
    }
}

struct TransferOnUsScreen_Previews: PreviewProvider {
    static var previews: some View {
        TransferOnUsScreen()
    }
}
